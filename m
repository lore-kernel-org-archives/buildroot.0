From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 13:42:09 +0100
Subject: [Buildroot] [PATCH 09/22] uClibc: add missing $(Q)
In-Reply-To: <1364113606-20836-10-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 24 Mar 2013 09:26:33 +0100")
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364113606-20836-10-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87r4j5m0ke.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Add a missing $(Q) in front of a MESSAGE call, which leads to the
 Thomas> message being displayed but also the command that shows the message.

Committed, thanks.

-- 
Bye, Peter Korsgaard
