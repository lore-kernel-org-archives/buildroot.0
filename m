From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 Dec 2012 22:46:15 +0100
Subject: [Buildroot] [PATCH 1/2] xserver_xorg-server: fix build on
	AArch64
In-Reply-To: <1356727276-13075-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 28 Dec 2012 21:41:16 +0100")
References: <1356727276-13075-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mwwxyhnc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Fixes the following build issue:
 Thomas> Making all in fb
 Thomas>   CC     libfb_la-fb24_32.lo
 Thomas> In file included from fb24_32.c:30:0:
 Thomas> fb.h:98:2: error: #error "GLYPHPADBYTES must be 4"

Committed, thanks.

Don't forget to send patch upstream.

-- 
Bye, Peter Korsgaard
