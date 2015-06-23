From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Jun 2015 22:58:59 +0200
Subject: [Buildroot] [PATCHv2] uclibc: add libgcc_s_resume fix
In-Reply-To: <1435079098-8424-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 23 Jun 2015 19:04:58 +0200")
References: <1435079098-8424-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871th25egc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit adds a fix for building uClibc 0.9.33.2 and uClibc-ng
 > 1.0.3 with gcc 5.1 on ARM, since we're about to add support for gcc
 > 5.1.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
