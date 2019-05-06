From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 6 May 2019 09:35:46 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-05-05
In-Reply-To: <20190506060044.CE8CA85CCF@whitealder.osuosl.org>
References: <20190506060044.CE8CA85CCF@whitealder.osuosl.org>
Message-ID: <20190506063546.hp5272fyzyt2zshw@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, May 06, 2019 at 06:00:39AM -0000, Thomas Petazzoni wrote:
> Detail of failures
> ------------------
> 
>      nds32le |         18xx-ti-utils-R8.7_SP3 | NOK | http://autobuild.buildroot.net/results/3c93cfac81f15f4c18eb7ad578ad86bb7bcf1c12 |     

glibc does not work well with BR2_STATIC_LIBS. The combination of 
BR2_STATIC_LIBS with glibc configuration seems to only happen in builds for 
nds32le. Why is that?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
