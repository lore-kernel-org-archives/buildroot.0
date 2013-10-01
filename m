From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Tue, 1 Oct 2013 15:15:41 +0200
Subject: [Buildroot] [PATCH 1/2] psplash: new package
In-Reply-To: <20131001120015.55f3d4c6@skate>
References: <1380615296-26194-1-git-send-email-phil@zankapfel.net>
 <20131001120015.55f3d4c6@skate>
Message-ID: <CAPiYbRLpxaKRLvdF4yo+Er-=pUL9iPrUQPT_f=fut0z-11asJg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 1 October 2013 12:00, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:
<snip>

> Does it build with a minimal uClibc toolchain? I.e, does the following
> configuration builds:
>
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="
> http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2013.05-1.tar.bz2
> "
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_PACKAGE_PSPLASH=y
>
> Other than that, it looks good!
>

Thanks for pointing me in that direction, turned out it needs wchar
support, I've sent a v2.

Phil
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131001/172a2eb8/attachment.html>
