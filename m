From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 06 Nov 2018 06:35:36 +0200
Subject: [Buildroot] Out of tree Linux kernel builds?
In-Reply-To: <02530ea6-3942-3fe1-91b8-9040e3838972@gmail.com>
References: <02530ea6-3942-3fe1-91b8-9040e3838972@gmail.com>
Message-ID: <87o9b27rhj.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Florian,

Florian Fainelli writes:
> Hi Yann, all,
>
> AFAIR a while back you mentioned that you were looking into adding
> support for out of tree Linux builds. Do you have working patches for
> that, or you would rather have someone take a stab at doing it?

What do you mean by "out of tree Linux builds"? Buildroot has supported
custom kernel tree build since long ago. Did you mean external kernel
modules?

  https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_packages_building_kernel_modules

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
