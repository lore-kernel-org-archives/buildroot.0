From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 22:15:26 +0100
Subject: [Buildroot] [PATCH] uclibc: convert accept4 to use cancel.h
 macros
In-Reply-To: <20171102070046.GA6819@waldemar-brodkorb.de>
References: <20171102070046.GA6819@waldemar-brodkorb.de>
Message-ID: <20171102221526.75efe53b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Nov 2017 08:00:47 +0100, Waldemar Brodkorb wrote:
> Fixes:
>  http://autobuild.buildroot.net/results/78e033fe9f43845581a5d87b21a8451f67520e44
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...03-convert-accept4-to-use-cancel.h-macros.patch | 102 +++++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 package/uclibc/0003-convert-accept4-to-use-cancel.h-macros.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
