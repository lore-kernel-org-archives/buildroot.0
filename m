From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 2 Sep 2015 20:16:35 +0300
Subject: [Buildroot] First rootfile system build using buildroot
In-Reply-To: <CAKpDV8uF2+EPKHTtcfSG6P43apra6ZeC=wd9q4X3_L-U3h98_g@mail.gmail.com>
References: <944894A3EB1D044A9003B2F944389BB20474C3458C@svr-wa-exch1.atg.lc>
 <CAKpDV8svFZsaBA_hZjpoM5SFdSohihmugGW_9jYps=zsNzG5Mw@mail.gmail.com>
 <20150902033810.GS17874@tarshish>
 <CAKpDV8u0ojKAuOJMEzFOjd7dKx6k9Sm-fK8Z5xk7Y7_xdJPNyg@mail.gmail.com>
 <20150902114729.GA18583@tarshish>
 <CAKpDV8vpO_2UUWUBssE6hDCV=Jh3b1sAeY4=V-b6xEazzdJAPg@mail.gmail.com>
 <55E700A5.3080403@imgtec.com>
 <CAKpDV8s=1pCEaM33q-5YRADPhrAfkEaRbncFKBPeb3CWwxz_Ew@mail.gmail.com>
 <55E70DF5.7060309@imgtec.com>
 <CAKpDV8uF2+EPKHTtcfSG6P43apra6ZeC=wd9q4X3_L-U3h98_g@mail.gmail.com>
Message-ID: <20150902171635.GB18583@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Katoch,

On Wed, Sep 02, 2015 at 10:27:01PM +0530, Dinesh Guleria wrote:
> >> And type the name of the defconfig (without the trailing _defconfig).
> As i need to build for raspberrypi.
> And as I have *raspberrypi_deconfig* in my following directory /config of
> buildroot.
> So i write the name as *raspberrypi *.
> 
> But getting following error at the time of make . see the attached image.

This option is about the *kernel* config, not Buildroot one. You find the list 
of kernel defconfig files under the arch/<your architecture>/configs/ 
directory of the *kernel*.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
