// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

enum Status {
    Active,
    Inactive
}

struct Course {
    string nama;
    Status status;
    uint quota;
    bool exists;
}

contract ClassManagement {
    mapping(bytes32 => Course) public courses;
    bytes32[] public courseCodes;

    function generateCode(string memory _nama, Status _status, uint _quota) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_nama, _status, _quota));
    }

    function addCourse(string memory _nama, Status _status, uint _quota) public {
        bytes32 _code = generateCode(_nama, _status, _quota);
        require(!courses[_code].exists, "Course already exists");

        courses[_code] = Course({
            nama: _nama,
            status: _status,
            quota: _quota,
            exists: true
        });

        courseCodes.push(_code);
    }

    function getAllCourses() public view returns (bytes32[] memory, string[] memory, Status[] memory, uint[] memory) {
        uint count = courseCodes.length;

        string[] memory names = new string[](count);
        Status[] memory statuses = new Status[](count);
        uint[] memory quotas = new uint[](count);

        for (uint i = 0; i < count; i++) {
            bytes32 code = courseCodes[i];
            Course memory course = courses[code];
            names[i] = course.nama;
            statuses[i] = course.status;
            quotas[i] = course.quota;
        }

        return (courseCodes, names, statuses, quotas);
    }

    // 4.00 buat versi getCourse dengan parameter code dan return 1 course data
    // function getCourse(bytes32 _code) public view returns (bytes32 memory, string memory, Status memory, uint memory) {

}