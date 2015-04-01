From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 23:47:15 +0200
Subject: [Buildroot] [PATCH v2 1/1] gnuradio: depends on shared libs
In-Reply-To: <1427739026-13418-1-git-send-email-gwenj@trabucayre.com>
References: <1427739026-13418-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150401234715.4099dc52@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Mon, 30 Mar 2015 20:10:26 +0200, Gwenhael Goavec-Merou wrote:

> diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> index 274afaa..fe89c01 100644
> --- a/package/gnuradio/Config.in
> +++ b/package/gnuradio/Config.in
> @@ -1,14 +1,15 @@
> -comment "gnuradio needs a toolchain w/ C++, IPV6, NPTL, largefile, wchar"
> +comment "gnuradio needs a toolchain w/ C++, IPV6, NPTL, largefile, wchar and shared libs"

s/shared libs/dynamic library/

See the Buildroot manual for the exact strings to use in this situation.

I've fixed that up, rebased the patch on top of the non-largefile
removal patches that I have merged, and applied. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
