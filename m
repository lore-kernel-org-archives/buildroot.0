From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Dec 2017 19:02:27 +0100
Subject: [Buildroot] [PATCH 8/8] support/testing: add tests for ATF
In-Reply-To: <20171203214811.3124-9-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 3 Dec 2017 22:48:11 +0100")
References: <20171203214811.3124-1-thomas.petazzoni@free-electrons.com>
 <20171203214811.3124-9-thomas.petazzoni@free-electrons.com>
Message-ID: <87o9n9yu6k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > These new tests only do build tests, but allow to quickly verify that
 > the ATF/U-Boot combinations for vexpress, Allwinner and Marvell
 > platforms all continue to build properly.

We will presumably soon have defconfigs using each 3 variants, so I
don't know how useful this is - But Ok, we can add it for now.

Committed, thanks.

-- 
Bye, Peter Korsgaard
