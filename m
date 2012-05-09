From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 May 2012 18:16:44 +0200
Subject: [Buildroot] [PATCH] package/crosstool-ng: bump version to
	1.15.2, update config files
In-Reply-To: <87y5p1ww2h.fsf@macbook.be.48ers.dk>
References: <1336518081-2809-1-git-send-email-yann.morin.1998@free.fr>
 <87y5p1ww2h.fsf@macbook.be.48ers.dk>
Message-ID: <201205091816.45043.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas, All,

On Wednesday 09 May 2012 11:19:34 Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  Yann> Update the version of crosstool-Ng used, bump to 1.15.2.
>  Yann> Also, update the bundled config files to match the new version.
> 
> Committed, thanks. I had to fixup our ctng handling for changes in the
> copy_toolchain_lib_root_api by Thomas, but that's unrelated to this
> version bump.

Was that related to the new sysroot-layout handling to cope with the
Linaro toolchains?

> I've also adjusted the default uClibc version/mode to match what we're
> using for the internal toolchain (0.9.33.1 / NPTL).

I pushed the new crosstool-NG version out so you could cut -rc1, and then
I was about to upgrade the default versions set in the .configs.

You beat me to it! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
