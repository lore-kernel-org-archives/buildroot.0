From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 21 Apr 2016 10:18:55 +0300
Subject: [Buildroot] how to add rfkill on latest buildroot package
In-Reply-To: <F9B05D23-92D1-44DA-B09F-0B43F982DECA@gmail.com>
References: <F9B05D23-92D1-44DA-B09F-0B43F982DECA@gmail.com>
Message-ID: <20160421071855.GR2476@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jehun

On Thu, Apr 21, 2016 at 12:04:50AM -0700, yoda zhong wrote:
> Manual says rfkill is under Hardware handling. But I can?t find it.
> Where is it? How can I add rfkill command into image.
> FYI, I use the latest stable version of buildroot.

In menuconfig the rfkill package should be under 'Target packages' -> 
'Hardware handling' -> 'rfkill'.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
