From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 19 May 2016 10:06:00 +0300
Subject: [Buildroot] [PATCH] libxml2: fix static build with xz
In-Reply-To: <ke301dx2eg.ln2@ID-313208.user.individual.net>
References: <83a61efc9b5c0ed716172544323ed519c8926902.1459187689.git.baruch@tkos.co.il>
 <ke301dx2eg.ln2@ID-313208.user.individual.net>
Message-ID: <20160519070600.GS2178@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Thu, May 19, 2016 at 08:35:32AM +0200, Bernd Kuhls wrote:
> Am Mon, 28 Mar 2016 20:54:49 +0300 schrieb Baruch Siach:
> > Add a patch that adds '-llzma' to the output of 'xml2-config --libs'
> > when xz is enabled. This fixes static build when xz is enabled.
> 
> Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> (compile-tested http://autobuild.buildroot.net/
> results/6db/6db405a097b192876c0b1b8d59051d614563c617/defconfig)

Thanks.

Upstream applied this patch[1], and version 2.9.4 should be release any time 
now[2]. So I thought we'll just wait for that. This patch may still be 
considered for master though.

[1] 
  https://git.gnome.org/browse/libxml2/commit/?id=2e354d7432dd4fd946328c242ff5289d9bfb3ce9

[2]
  https://mail.gnome.org/archives/xml/2016-May/msg00010.html

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
