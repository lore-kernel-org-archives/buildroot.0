From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 15:21:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: add PPC64BE ELFv2
 support
In-Reply-To: <20200227201505.8109-1-vfazio@xes-inc.com>
References: <20200227201505.8109-1-vfazio@xes-inc.com>
Message-ID: <20200427152111.1729c93a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 27 Feb 2020 14:15:05 -0600
Vincent Fazio <vfazio@xes-inc.com> wrote:

> From: Vincent Fazio <vfazio@gmail.com>
> 
> musl libc uses ELFv2 by default for all PPC64 targets.
> 
> Now, OpenSSL libraries built with musl targeting PPC64BE should build
> and function as expected.
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> ---
>  ...Fv2-ABI-on-some-ppc64-big-endian-sys.patch | 35 +++++++++++
>  ...m-ppc-xlate.pl-add-linux64v2-flavour.patch | 63 +++++++++++++++++++
>  2 files changed, 98 insertions(+)
>  create mode 100644 package/libopenssl/0004-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
>  create mode 100644 package/libopenssl/0005-crypto-perlasm-ppc-xlate.pl-add-linux64v2-flavour.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
