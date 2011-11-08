From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 9 Nov 2011 00:46:58 +0100
Subject: [Buildroot] Future...TOOLCHAIN builds..
In-Reply-To: <20111107163557.27aaa627@skate>
References: <1531E53627F1F749B4FE809BF2A4EB6702C39314@WETMEX10.loepfe.com>
 <20111107163557.27aaa627@skate>
Message-ID: <201111090046.58926.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Noel, All,

On Monday 07 November 2011 16:35:57 Thomas Petazzoni wrote:
> Le Mon, 7 Nov 2011 16:07:35 +0100,
> "Vellemans, Noel" <Noel.Vellemans@visionBMS.com> a ?crit :
> > 2) Another question that pops-up when building a CROSSTOOL-NG toolchain,
> > is that I'm not able to select a toolchain with ARM-VECTOR-floating
> > point support is this correct? 
> 
> In Target Options -> Floating Point, you can choose between hardware
> floating point and software floating point.

This is in the ctng-menuconfig.

This will probably be a FAQ at some point, when people notice that all the
nice target options they were used to finf in buildroot's menuconfig will
disapear when the crosstool-NG backend is used.
We'll have to prominently point to 'make ctng-menuconfig' in the doc.

> And I'm sure than Yann, crosstool-NG's
> maintainer, is definitely interested by patches improving things in
> that area.

Yes, definitely. This all happens there:
  home: http://crosstool-ng.org/
  ML  : http://sourceware.org/ml/crossgcc/

> Buildroot has never supported officially Cygwin, and nobody tests this.
> I think crosstool-NG has better support for this, but Yann might
> comment on this.

Yes, indeed. There have been many reports of sucess.
Although Cygwin is not an official host in my point of view, as I can't test,
I try not to break it. If it happens, and someone sends a tested patch (or I
can trivially deduce how to fix it myself), I'm happy to apply Cugwin-related
patches to the tree. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
