From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2015 19:01:49 +0200
Subject: [Buildroot] [PATCH 1/7] configs: remove gnublin_defconfig
In-Reply-To: <1443901457-7914-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 3 Oct 2015 20:44:11 +0100")
References: <1443901457-7914-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1443901457-7914-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y4fik1oi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This defconfig tries to fetch its kernel source code and U-Boot source
 > code from gitorious.org, which is not longer available. Therefore,
 > this defconfig has been failing to build since quite some time. Since
 > there's no obvious other place to grab the kernel and u-boot source
 > code, and the defconfig was not updated since a long time, let's
 > simply get rid of it.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

You forgot to remove board/gnublin/README.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
