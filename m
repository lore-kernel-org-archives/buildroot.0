From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 3 Jul 2016 10:05:20 +0300
Subject: [Buildroot] [PATCH 14/69] fwup: add explicit dependencies for
	host variant
In-Reply-To: <20160703085648.01301ba4@free-electrons.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
 <1467498098-23731-15-git-send-email-julien.floret@6wind.com>
 <20160703085648.01301ba4@free-electrons.com>
Message-ID: <20160703070519.GC2750@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Jul 03, 2016 at 08:56:48AM +0200, Thomas Petazzoni wrote:
> On Sun,  3 Jul 2016 00:20:43 +0200, Julien Floret wrote:
> >  FWUP_CONF_ENV = ac_cv_path_HELP2MAN=""
> 
> Unrelated to your patch, but I'm wondering why we pass
> ac_cv_path_HELP2MAN="" for the target variant (which was needed to fix
> some build failures), and not to the host variant. I'm adding Baruch in
> Cc since he fixed this problem.

The simple answer is that since help2man works just fine for the host binary 
of fwup by definition, there is no build breakage. We may add it to the host 
variant as well to shorten build time somewhat, though I'm not sure it's worth 
the trouble.

Have fun at Toulouse.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
