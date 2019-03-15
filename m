From: Boris-Ben Shapiro <erectcrested@gmail.com>
Date: Fri, 15 Mar 2019 17:59:01 +0200
Subject: [Buildroot] Nodejs failure for arm cortex-A8
In-Reply-To: <871s381xre.fsf@tarshish>
References: <CAH2Z6C=P+MmQNXUaEKBoKZ+FvmyCgoUy39FSvEDAvecsYb=PVQ@mail.gmail.com>
 <871s381xre.fsf@tarshish>
Message-ID: <CAH2Z6Cms8rcYJ8jsXZh5O_dJOo7SCgR6KefAYLMjw4t-XjAc=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch.
I am a bit tied to Ubuntu 14.04. Can you guide me on how to update the
nodejs toolchain dependency? I use the CodeSourcery 2014 toolchain.
There is no other option for CS toolchain, only buildroot toolchain
which I don't want to use, as my project already tested with CS
toolchain.
Is it a difficult task to update nodejs toolchain version dependecy?

On Fri, 15 Mar 2019 at 08:01, Baruch Siach <baruch@tkos.co.il> wrote:
>
> Hi Ben,
>
> On Thu, Mar 14 2019, Boris-Ben Shapiro wrote:
> > I am trying to compile buildroot master branch on ubuntu 14.04 32-bit.
> > The target compilation is for TI DM8148 processor (DaVinci series).
> > This is the defconfig I used: http://code.bulix.org/wbenum-621398
> > And this is full configuration: http://code.bulix.org/lqktww-621399
> >
> > I get a multiple failures while compiling nodejs package:
> > http://code.bulix.org/8gdwec-621396
> >
> > Can anyone please help with this?
>
> Ubuntu 14.04 carries gcc 4.8, I guess. Current nodejs requires gcc 4.9.
>
>   https://github.com/nodejs/node/commit/d13a65ad68c429884434cdcd94c52b79a6d69717
>
> Try a newer host toolchain.
>
> I guess we need to update the nodejs toolchain version dependency.
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
