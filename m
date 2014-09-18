From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 18 Sep 2014 22:12:08 +0200
Subject: [Buildroot] [PATCH 1/4] arch: remove BR2_arm920 reference
In-Reply-To: <1410814919-11523-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 15 Sep 2014 23:01:56 +0200")
References: <1410814919-11523-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1410814919-11523-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8761gk663r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The BR2_GCC_TARGET_CPU defines a value for the BR2_arm920 case, but
 > this option does not exist. Therefore, this commit removes one line of
 > dead code.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
