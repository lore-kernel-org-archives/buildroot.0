From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 11:47:14 +0200
Subject: [Buildroot] [PATCH] libmnl: bump to version 1.0.4
In-Reply-To: <1471662953-21916-1-git-send-email-gustavo@zacarias.com.ar>
References: <1471662953-21916-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160820114714.5a9c8e45@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Aug 2016 00:15:53 -0300, Gustavo Zacarias wrote:
> And drop upstream patch.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libmnl/0001-uclinux.patch | 26 --------------------------
>  package/libmnl/libmnl.hash        |  6 +++---
>  package/libmnl/libmnl.mk          |  3 +--
>  3 files changed, 4 insertions(+), 31 deletions(-)
>  delete mode 100644 package/libmnl/0001-uclinux.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
