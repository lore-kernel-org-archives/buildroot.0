From: MAVINDI Dimitri <dimitri.mavindi@thalesgroup.com>
Date: Tue, 19 Sep 2017 12:09:39 +0200
Subject: [Buildroot] BUILDROOT : Iconv issue
Message-ID: <B0E42342CF573846B53369E0E3AD66A8E7C07865A7@THSONEA01CMS12P.one.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


-----Message d'origine-----
De?: MAVINDI Dimitri 
Envoy??: mardi 19 septembre 2017 12:02
??: 'Baruch Siach'
Objet?: RE: [Buildroot] BUILDROOT : Iconv issue

Hi Baruch,

Thank you for your reply.
I confirm that I have BR2_TOOLCHAIN = y.

>What do you need libiconv for?

I have a test tool using a third-party package that requires libiconv.

Regards.

-----Message d'origine-----
De?: Baruch Siach [mailto:baruch at tkos.co.il] Envoy??: mardi 19 septembre 2017 11:51 ??: MAVINDI Dimitri Cc?: buildroot at busybox.net Objet?: Re: [Buildroot] BUILDROOT : Iconv issue

Hi MAVINDI Dimitri,

On Tue, Sep 19, 2017 at 11:42:01AM +0200, MAVINDI Dimitri wrote:
> I would like to make libiconv part of our buildroot.
> How to make sure that this package part of the result knowing that

  # provides libiconv functionality, and having both confuses packages.

What do you need libiconv for?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
