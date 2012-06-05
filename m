From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 5 Jun 2012 09:42:00 +0300
Subject: [Buildroot] adding a package
In-Reply-To: <CAGXs5wVOE2vH3wHcqS0Af2T0Oeg2GdNtktoK=o3Y3sGog9vSxQ@mail.gmail.com>
References: <CAGXs5wXdM_jfwH-9C=j=Oz=4L0dpF2pDAucqx9kYaTBy3MJAJQ@mail.gmail.com>
 <20120605055548.GA18708@sapphire.tkos.co.il>
 <CAGXs5wVOE2vH3wHcqS0Af2T0Oeg2GdNtktoK=o3Y3sGog9vSxQ@mail.gmail.com>
Message-ID: <20120605064159.GB18708@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Kevin,

On Tue, Jun 05, 2012 at 09:28:55AM +0300, Kevin Wilson wrote:
> Thanks for your quick response !
> >If you need a package manager try
> > something like yocto (http://www.yoctoproject.org).
> >
> I don't have experience with Yokto
> Any idea: does Yokto has some known package manager mechansim (like
> apt-get or rpm?) or is it uses some unique package manager of its own
> ?

I don't have experience with yocto either. A quick glance at 
http://www.yoctoproject.org/docs/current/yocto-project-qs/yocto-project-qs.html 
(especially the block diagram) seems to indicate that yocto support more than 
one package manager.

baruch

> On Tue, Jun 5, 2012 at 8:55 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> > Hi Kevin,
> >
> > On Tue, Jun 05, 2012 at 08:36:19AM +0300, Kevin Wilson wrote:
> >> I succeeded with booting with buildroot on ARM processor with the default
> >> settings (only selecting CPU as ARM).
> >> Now I want to add packages (like rp-pppoe)
> >> What is the proper way to do it ?
> >> I of course know about the possibility of selecting the rp-pppoe package from
> >> "make menuconfig" and creating rootfs tar again, delete the original
> >> rootfs and installing
> >> the new rootfs over the old one,
> >> Is there a more efficient way ? like using some package manager?
> >
> > Buildroot does not have a package manager. This is a design decision, intended
> > to make Buildroot as simple as possible. If you need a package manager try
> > something like yocto (http://www.yoctoproject.org).
> >
> > baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
