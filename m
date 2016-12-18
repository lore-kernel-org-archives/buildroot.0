From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Dec 2016 12:24:49 +0100
Subject: [Buildroot] [PATCH] jack2: fix NGREG build failures
In-Reply-To: <1481991706-7060-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1481991706-7060-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20161218122449.1a926d83@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Dec 2016 17:21:46 +0100, Thomas Petazzoni wrote:

>  package/jack2/0001-Add-support-for-nios2.patch     | 34 ---------
>  .../jack2/0001-Improve-check-for-ucontext.patch    | 84 ++++++++++++++++++++++
>  2 files changed, 84 insertions(+), 34 deletions(-)
>  delete mode 100644 package/jack2/0001-Add-support-for-nios2.patch
>  create mode 100644 package/jack2/0001-Improve-check-for-ucontext.patch

For information, my jack2 patch has been applied upstream:

  https://github.com/jackaudio/jack2/commit/e2cba86e65887f09cba7645134f845ce6de81d99

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
