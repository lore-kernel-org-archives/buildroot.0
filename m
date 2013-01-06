From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 6 Jan 2013 07:41:13 +0200
Subject: [Buildroot] [PATCH] divine: fix divine-config
In-Reply-To: <50E6EDB5.9070004@petroprogram.com>
References: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
 <50E6BFE2.2090405@zacarias.com.ar>
 <CAHXCMMKhDpanjesHYjMSh-dcAHKt-84B3gEgyzs6UgN_8VRZvQ@mail.gmail.com>
 <50E6E757.10809@zacarias.com.ar>
 <50E6EDB5.9070004@petroprogram.com>
Message-ID: <20130106054113.GD13545@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stefan,

On Fri, Jan 04, 2013 at 04:56:53PM +0200, Stefan Fr?berg wrote:
> Hello Gustavo, all

[...]

> (It took a long time for me to figure why wireshark that im trying to
> compile here did not
> work out with libpcap, untill I found out that the
> $(STAGING_DIR)/usr/bin/pcap-config spit a
> wrong prefix all the time...)

Good to see work on wireshark. Did you fix the RPATH problem I encountered 
while trying to build tshark 
(http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/48053) ?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
