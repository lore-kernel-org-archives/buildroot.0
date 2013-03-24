From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 13:44:13 +0100
Subject: [Buildroot] [PATCH 11/22] libpcap: add missing flex/bison
	dependencies
In-Reply-To: <1364113606-20836-12-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 24 Mar 2013 09:26:35 +0100")
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364113606-20836-12-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ip4hm0gy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> In preparation for the removal of the flex/bison mandatory
 Thomas> dependencies, make sure libpcap builds host-flex/host-bison.

Committed, thanks.

-- 
Bye, Peter Korsgaard
