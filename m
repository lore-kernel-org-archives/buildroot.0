From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Oct 2016 23:19:58 +0200
Subject: [Buildroot] [PATCH] uclibc: remove linker scripts for
 libubacktrace/libuargp
In-Reply-To: <20160930172511.GA20982@waldemar-brodkorb.de>
References: <20160930172511.GA20982@waldemar-brodkorb.de>
Message-ID: <20161003231958.60e0aa94@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Sep 2016 19:25:11 +0200, Waldemar Brodkorb wrote:
> They are not required anymore and break some builds.
> 
> Tested-by: Lance Fredrickson <lancethepants@gmail.com>
> Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
> ---
>  ...uargp-remove-unneeded-and-false-linker-sc.patch | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 package/uclibc/0002-ubacktrace-uargp-remove-unneeded-and-false-linker-sc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
