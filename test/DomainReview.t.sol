// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../src/DomainReview.sol";

contract DomainReviewTest {
    function testDomainReviewLane() public {
        DomainReview lens = new DomainReview();
        DomainReview.Item memory item = DomainReview.Item(51, 22, 13, 88);
        require(lens.score(item) == 173, "domain score mismatch");
        require(lens.lane(item) == 2, "domain lane mismatch");
    }
}
