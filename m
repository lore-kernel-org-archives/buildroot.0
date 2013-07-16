From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 16 Jul 2013 15:12:50 +0200
Subject: [Buildroot] [PATCHv3 04/14] binutils: exclude binutils versions
	that don't support EABIhf
In-Reply-To: <1373961805-3901-5-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 16 Jul 2013 10:03:15 +0200")
References: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373961805-3901-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mwpm1wdp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The ARM EABIhf support was introduced in Binutils 2.22, so earlier
 Thomas> versions should not be selected when EABIhf is used.

Committed, thanks.

-- 
Bye, Peter Korsgaard
