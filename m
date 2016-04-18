From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 21:21:28 +0200
Subject: [Buildroot] [PATCH] uclibc: update to uClibc-ng 1.0.14
In-Reply-To: <20160418190302.GA19237@waldemar-brodkorb.de>
References: <20160418190302.GA19237@waldemar-brodkorb.de>
Message-ID: <20160418212128.09113c4a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Apr 2016 21:03:02 +0200, Waldemar Brodkorb wrote:
> Remove patch, which was applied upstream.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...implify-handling-of-Thumb-related-options.patch | 147 ---------------------
>  package/uclibc/uclibc.hash                         |   2 +-
>  package/uclibc/uclibc.mk                           |   2 +-
>  3 files changed, 2 insertions(+), 149 deletions(-)
>  delete mode 100644 package/uclibc/0001-arm-simplify-handling-of-Thumb-related-options.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
