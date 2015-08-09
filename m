From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Aug 2015 11:25:26 +0200
Subject: [Buildroot] [PATCHv2] package/wvstreams: disable for musl
 toolchains
In-Reply-To: <1439031422-24117-1-git-send-email-romain.naour@openwide.fr>
References: <1439031422-24117-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150809112526.4abcfb22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat,  8 Aug 2015 12:57:02 +0200, Romain Naour wrote:

> -comment "wvdial needs a toolchain w/ C++, dynamic library"
> +comment "wvdial needs a (e)glibc or uClibc-ng toolchain w/ C++, dynamic library"

I've replaced uClibc-ng by uClibc here.

> -comment "wvstreams needs a toolchain w/ C++, dynamic library"
> +comment "wvstreams needs a (e)glibc or uClibc-ng toolchain w/ C++, dynamic library"

and here.

And then applied your patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
