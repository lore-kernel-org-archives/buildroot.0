From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 2 Jan 2016 01:17:40 -0500
Subject: [Buildroot] [PATCH 0/3] vboot-utils fixes
In-Reply-To: <cover.1451483256.git.alex.suykov@gmail.com>
References: <cover.1451483256.git.alex.suykov@gmail.com>
Message-ID: <20160102061740.GQ25803@vapier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30 Dec 2015 16:05, Alex Suykov wrote:
> vboot-utils depend on relatively recent host kernel headers,
> and fail to build on some of the autobuilders.
> 
> MTD_CHAR_MAJOR definition appears in linux-3.13, and ssize_t related
> failures probably happen with glibc from the same timeframe.
> 
> Sadly I cannot check it properly, I can only tell it does not break
> builds on newer systems. If possible, please try them on some older
> systems before applying.
> 
> If everything works well, I'd try to send 0002 upstream, but probably not 0001.
> It's an ugly fix and I don't think upstream cares much about older kernels.

please send all of them to us via gerrit
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160102/80135f9b/attachment.asc>
