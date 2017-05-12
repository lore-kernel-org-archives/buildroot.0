From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 12 May 2017 18:45:23 +0000
Subject: [Buildroot] Analysis of build results for 2017-05-08
In-Reply-To: <20170509093537.5560182b@free-electrons.com>
References: <20170509062824.6D04D208E1@mail.free-electrons.com>
 <20170509093537.5560182b@free-electrons.com>
Message-ID: <1494614722.3791.33.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Tue, 2017-05-09 at 09:35 +0200, Thomas Petazzoni wrote:

[snip]

> > 
> > ?????????arc |???????????????????libcdio-0.94 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_17baccfb
> > 72de050aee9bc8ba2b46442afe45292d&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=TFGTrHTW9WOac8wl51yNJwEmwLaLBj_
> > mMTu9IApKIYo&s=meSor8oRLa-w41d8o2M_EBlW3BrnjGzNhsN9_YeF7Qo&e=??|?????
> > ?????????arc |???????????????????libcdio-0.94 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_8f8ad583
> > f03edb6294dce3cf6de51391320bbafc&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=TFGTrHTW9WOac8wl51yNJwEmwLaLBj_
> > mMTu9IApKIYo&s=HIPQ3tv-_7iX0r36BRA8ysE1WukatcPMABcuyCJ9_T8&e=??|?????
> > ?????????arc |???????????????????libcdio-0.94 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_a262cc45
> > 114cc3ddf51cb9db5ab35971bf32b8cb&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=TFGTrHTW9WOac8wl51yNJwEmwLaLBj_
> > mMTu9IApKIYo&s=miK5P_vR-3QPC8KVDyjBCCvNV5-gE86jpb_eeM527bM&e=??|?????
> 
> ARC toolchain issue. Alexey, could you have a look ?

Indeed, got it reported to our Binutils guy.
Once fixed will update Buildroot with a patch on top of arc-2017.03 tools.

-Alexey
