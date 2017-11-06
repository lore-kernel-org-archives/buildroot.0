From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 6 Nov 2017 11:07:57 +0200
Subject: [Buildroot] [PATCH] ethtool: Allow enabling/disabling pretty
 printing
In-Reply-To: <20171106100535.1ae977ce@windsurf.home>
References: <20171106012906.22000-1-f.fainelli@gmail.com>
 <87zi7zyeju.fsf@dell.be.48ers.dk>
 <20171106100535.1ae977ce@windsurf.home>
Message-ID: <20171106090757.kekhjjkecm3ck3e3@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Nov 06, 2017 at 10:05:35AM +0100, Thomas Petazzoni wrote:
> On Mon, 06 Nov 2017 09:52:37 +0100, Peter Korsgaard wrote:
> 
> >  > +if BR2_PACKAGE_ETHTOOL
> >  > +
> >  > +	config BR2_PACKAGE_ETHTOOL_PRETTY_PRINT
> >  > +		bool "enable pretty printing"
> >  > +		default y
> 
> Should this really be "default y" ? Baruch reported a significant size
> increase with this option enabled.

This is the current default. The added option only allows to to remove pretty 
printing.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
