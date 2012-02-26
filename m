From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Sun, 26 Feb 2012 05:39:01 +0100
Subject: [Buildroot] [PATCH V2] openocd: fetch package from git
 repository and update version
In-Reply-To: <201202251631.25121.arnout@mind.be>
References: <20120224190112.GB10670@game.jcrosoft.org>
 <1330119073-24810-1-git-send-email-aletes.xgr@gmail.com>
 <20120225033301.GC10670@game.jcrosoft.org>
 <201202251631.25121.arnout@mind.be>
Message-ID: <20120226043901.GE10670@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16:31 Sat 25 Feb     , Arnout Vandecappelle wrote:
> On Saturday 25 February 2012 04:33:01 Jean-Christophe PLAGNIOL-VILLARD wrote:
> > On 19:31 Fri 24 Feb     , Alexandre Pereira da Silva wrote:
> > > This overrided the DOWNLOAD_GIT method to also fetch the submodules used
> > > by openocd.
> > > Removed patches that are not needed anymore by the new version.
> > > Updated the gnu99 patch to use configure.ac instead of configure.in.
> > > Fix a build problem in the stm32_stlink.c file.
> > > 
> > > Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
> > > ---
> > again NACK
> > 
> > DO NOT USE GIT in the release
> 
>  Instead of just shouting at Alexandre, perhaps you can explain why it's
> a bad idea to use the git version for openocd...
I known when I'm shuting someeone and why and how to do it
so please never resend such comment

Best Regards,
J.
