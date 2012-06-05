From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 5 Jun 2012 08:55:49 +0300
Subject: [Buildroot] adding a package
In-Reply-To: <CAGXs5wXdM_jfwH-9C=j=Oz=4L0dpF2pDAucqx9kYaTBy3MJAJQ@mail.gmail.com>
References: <CAGXs5wXdM_jfwH-9C=j=Oz=4L0dpF2pDAucqx9kYaTBy3MJAJQ@mail.gmail.com>
Message-ID: <20120605055548.GA18708@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Kevin,

On Tue, Jun 05, 2012 at 08:36:19AM +0300, Kevin Wilson wrote:
> I succeeded with booting with buildroot on ARM processor with the default
> settings (only selecting CPU as ARM).
> Now I want to add packages (like rp-pppoe)
> What is the proper way to do it ?
> I of course know about the possibility of selecting the rp-pppoe package from
> "make menuconfig" and creating rootfs tar again, delete the original
> rootfs and installing
> the new rootfs over the old one,
> Is there a more efficient way ? like using some package manager?

Buildroot does not have a package manager. This is a design decision, intended 
to make Buildroot as simple as possible. If you need a package manager try 
something like yocto (http://www.yoctoproject.org).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
