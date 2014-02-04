From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Feb 2014 15:25:55 +0100
Subject: [Buildroot] [PATCH] uclibc: fix sh2a option definition
In-Reply-To: <1391523503-7867-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 4 Feb 2014 15:18:23 +0100")
References: <1391523503-7867-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mwi754zw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The uClibc options for sh2a is SH2A, not SHA2, and this value should
 > be used for sh2a, not sh2.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
