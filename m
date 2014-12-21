From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 16:41:28 +0100
Subject: [Buildroot] [PATCH 1/1] add new package tinc
In-Reply-To: <1418741278-32077-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1418741278-32077-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <20141221164128.43d07933@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Zoltan Gyarmati,

On Tue, 16 Dec 2014 15:47:58 +0100, Zoltan Gyarmati wrote:
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> ---
>  package/Config.in      |  1 +
>  package/tinc/Config.in | 11 +++++++++++
>  package/tinc/tinc.mk   | 13 +++++++++++++
>  3 files changed, 25 insertions(+)
>  create mode 100644 package/tinc/Config.in
>  create mode 100644 package/tinc/tinc.mk

Patch applied, thanks. I've only done some minor changes:

    [Thomas:
     - fix license from GPLv2 to 'GPLv2+ with OpenSSL exception'
     - add -std=c99 to CFLAGS, otherwise it doesn't build with a minimal
       toolchain configuration
     - add BR2_USE_MMU dependency since fork() is used.]

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
