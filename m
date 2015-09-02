From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 2 Sep 2015 06:38:10 +0300
Subject: [Buildroot] First rootfile system build using buildroot
In-Reply-To: <CAKpDV8svFZsaBA_hZjpoM5SFdSohihmugGW_9jYps=zsNzG5Mw@mail.gmail.com>
References: <CAKpDV8uLvtaLFK=Oxd5vw-zpkzB9C+m0_hhmx-9meZSRViW12g@mail.gmail.com>
 <944894A3EB1D044A9003B2F944389BB20474C344F7@svr-wa-exch1.atg.lc>
 <CAKpDV8tYxteVo=nKwMih_Ub-dxCQM=xh2G-AC3riPevrMySrNw@mail.gmail.com>
 <944894A3EB1D044A9003B2F944389BB20474C3452F@svr-wa-exch1.atg.lc>
 <CAKpDV8stME3N6uU8n_DVUYp=sgLGr9RDk_563FCy8XQqRQSL5Q@mail.gmail.com>
 <944894A3EB1D044A9003B2F944389BB20474C34560@svr-wa-exch1.atg.lc>
 <944894A3EB1D044A9003B2F944389BB20474C34562@svr-wa-exch1.atg.lc>
 <CAKpDV8uny8GAJrEkEBmMdcboOrGuVQ4G09KRtL9yuvgH1XKE=Q@mail.gmail.com>
 <944894A3EB1D044A9003B2F944389BB20474C3458C@svr-wa-exch1.atg.lc>
 <CAKpDV8svFZsaBA_hZjpoM5SFdSohihmugGW_9jYps=zsNzG5Mw@mail.gmail.com>
Message-ID: <20150902033810.GS17874@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Katoch,

On Wed, Sep 02, 2015 at 05:59:37AM +0530, Dinesh Guleria wrote:
> Now my root filesystem is build, please suggest can i run it using qemu ?
> 
> Which version of qemu for ARM to use, any reference link which anyone on
> list  may have used in past ?

There is a list of tested qemu configurations at configs/qemu_*. Instructions 
for running them are in readme.txt files under board/qemu/.

Hope this helps,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
