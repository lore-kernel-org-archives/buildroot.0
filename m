From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 16 Mar 2016 21:40:51 -0400
Subject: [Buildroot] [PATCH 13/16] elf2flt: disable Werror to avoid
 build issues
In-Reply-To: <1458164602-16983-14-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-14-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160317014051.GN6588@vapier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16 Mar 2016 22:43, Thomas Petazzoni wrote:
> Some of the debugging printf use incorrect formats, which cause some
> warnings. Due to the use of -Werror by default, the build breaks
> unnecessarily. Therefore, disable -Werror when building elf2flt.

you should send a patch and/or open an issue.
the build bot is clean for all the targets w/Werror:
	https://travis-ci.org/uclinux-dev/elf2flt
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160316/b5ef64a1/attachment.asc>
