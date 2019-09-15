From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 15 Sep 2019 15:57:09 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-08-31
In-Reply-To: <20190901061705.4BDB686C34@whitealder.osuosl.org>
References: <20190901061705.4BDB686C34@whitealder.osuosl.org>
Message-ID: <20190915155709.GB49010@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Sun, 01 Sep 2019 06:16:59 -0000, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> [...]
>
>     arm      |        webkitgtk-2.24.4        | NOK | http://autobuild.buildroot.net/results/faa23c0e648b916d0fb01adb95948234d6db7a71 |     

This build failure is caused due to a missing dependency on host-perl,
which includes the JSON:PP package that CMake cannot find and is used
by scripts used at WebKit's build time. The "wpewebkit" package has the
same issue.

I will submit patches momentarily.

Cheers,
?Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190915/ee415cb3/attachment.asc>
