From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 18 Aug 2015 18:34:11 +0300
Subject: [Buildroot] Telnet server in target file system
In-Reply-To: <CAJ2oMhLG6camYr4xyojWJTZq8BbB87E_CFJ+2ZQfn4h-uo+PYA@mail.gmail.com>
References: <CAJ2oMhLG6camYr4xyojWJTZq8BbB87E_CFJ+2ZQfn4h-uo+PYA@mail.gmail.com>
Message-ID: <20150818153411.GW2765@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ran,

On Tue, Aug 18, 2015 at 05:04:26PM +0300, Ran Shalit wrote:
> I would like to ask how is best to add telnet support in target file system.
> Is it required to add NETKITTELNET package
> Symbol: BR2_PACKAGE_NETKITTELNET
> 
> Or is it suffecient to add TELNETD option in busybox.

The netkittelnet package is not in Buildroot since the 2014.02 release[1]. For 
more recent Buildroot versions your only option is to modify the Busybox 
.config to add TELNETD.

[1] http://git.buildroot.net/buildroot/commit/?id=560fe85bf7fb81956e80848c8bb28d7a6d00a2a2

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
