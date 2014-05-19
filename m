From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 May 2014 00:30:23 +0200
Subject: [Buildroot] [PATCH 1/2] gdb: fix build of host-gdb 7.4
In-Reply-To: <1400537239-24812-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 20 May 2014 00:07:18 +0200")
References: <1400537239-24812-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zjidieps.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The build of host-gdb 7.4 fails due to some texinfo issue. To avoid
 > that, use the same trick as is used for the target variant of gdb:
 > tell gdb that makeinfo is missing.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
