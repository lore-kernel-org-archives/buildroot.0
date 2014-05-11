From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 11 May 2014 12:45:35 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-10
In-Reply-To: <20140511063009.DE62C100F87@stock.ovh.net>
References: <20140511063009.DE62C100F87@stock.ovh.net>
Message-ID: <20140511094535.GF4096@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, May 11, 2014 at 08:30:09AM +0200, Thomas Petazzoni wrote:
>        arm |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/eefa8efbe6e6a6b203c02c2977d29be9c77846cb/

Build log says:

checking for backtrace in -lunwind... no
configure: error: Couldn't find or use libunwind.

But I can't reproduce it here. Thomas, can you look into config.log?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
