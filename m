From: Salvatore Fassi <salvatore.fassi@gmail.com>
Date: Wed, 5 Mar 2008 18:16:33 +0100
Subject: [Buildroot] Glibc instead of uclibc
In-Reply-To: <20080305165910.GA1935@real.realitydiluted.com>
References: <c05908680803050744i38177299u2af49445fdff5990@mail.gmail.com>
	<20080305165910.GA1935@real.realitydiluted.com>
Message-ID: <c05908680803050916l5077f6f7xfc0e2d3100d60fa8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So is not possible to use the toolchain that is currently installed on my
linux pc?
Must I download binutils, gcc etc etc to compile a brand new toolchain
(following the instructions provided in some cross-compiler how-to)?


On Wed, Mar 5, 2008 at 5:59 PM, <sjhill@realitydiluted.com> wrote:

> The only way to use glibc is to build an external glibc toolchain and
> then specify using an external toolchain in buildroot.
>
> -Steve
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080305/4836dbce/attachment.htm 
