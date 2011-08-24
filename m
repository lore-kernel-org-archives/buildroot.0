From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 24 Aug 2011 18:55:53 +0200
Subject: [Buildroot] License for patches
In-Reply-To: <j33814$hoj$1@dough.gmane.org>
References: <4E5517E0.30003@finalbit.de>
 <201108241205.23310.vapier@gentoo.org> <j33814$hoj$1@dough.gmane.org>
Message-ID: <201108241855.53895.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lars, Grant, All,

On Wednesday 24 August 2011 18:14:28 Grant Edwards wrote:
> On 2011-08-24, Mike Frysinger <vapier@gentoo.org> wrote:
> > On Wednesday, August 24, 2011 11:25:20 Lars Reemts wrote:
> 
> >> Which license is relevant for the package specific patches distributed
> >> by buildroot? Formally it must be the GPL.
> >
> > says who ?  i dont see the logic here.
> 
> According to http://buildroot.uclibc.org/:
> 
>   Buildroot is a set of Makefiles and patches [....]
>   
>   Buildroot is [...] licensed under the GNU GENERAL PUBLIC LICENSE V2
>   (Or later).
> 
> Seems pretty clear to me: the patches are under the GPL.
> 
> The question is what happens when you combine GPL'd source (the
> patches) with original source that's not under GPL.  It seems like a
> very legitimate question.

The stance I take with crosstool-NG regarding this, is:
 - crosstool-NG by itself is licensed under the GPLv2
 - the documentation is licensed under CC-BY-SAv2.5
 - patches are available under the same license as the project they apply to
 - a few other licenses here and there (kconfig as GLPv2, etc...)
 - the above does not apply to any file with an associated license (embedded
   in the file, or in an accompanying file)

In my opinion, for what it's worth, is that the same should apply to
buildroot:
 - buildroot by itself (Makefiles, and so on...) is GPLv2+
 - patches are available under the same license as the project they apply to
 - and so...

This would indeed need clarification from the buildroot developpers.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
