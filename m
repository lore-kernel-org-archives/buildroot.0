From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Feb 2014 12:06:43 +0100
Subject: [Buildroot] [PATCH] arch: remove sh2, sh3 and sh3eb support
In-Reply-To: <1391523934-8394-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 4 Feb 2014 15:25:34 +0100")
References: <1391523934-8394-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ppn124zg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This patch removes the sh2, sh3 and sh3eb support, because the user
 > base is inexistent, and the Linux support for these architectures is
 > poor. The sh2a support is preserved, because at least one user
 > expressed interest in this architecture, and is actually using it:

 >   http://lists.busybox.net/pipermail/buildroot/2013-April/070399.html

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
