From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 25 Feb 2012 16:31:24 +0100
Subject: [Buildroot] [PATCH V2] openocd: fetch package from git
	repository and update version
In-Reply-To: <20120225033301.GC10670@game.jcrosoft.org>
References: <20120224190112.GB10670@game.jcrosoft.org>
 <1330119073-24810-1-git-send-email-aletes.xgr@gmail.com>
 <20120225033301.GC10670@game.jcrosoft.org>
Message-ID: <201202251631.25121.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 25 February 2012 04:33:01 Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 19:31 Fri 24 Feb     , Alexandre Pereira da Silva wrote:
> > This overrided the DOWNLOAD_GIT method to also fetch the submodules used
> > by openocd.
> > Removed patches that are not needed anymore by the new version.
> > Updated the gnu99 patch to use configure.ac instead of configure.in.
> > Fix a build problem in the stm32_stlink.c file.
> > 
> > Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
> > ---
> again NACK
> 
> DO NOT USE GIT in the release

 Instead of just shouting at Alexandre, perhaps you can explain why it's
a bad idea to use the git version for openocd...

 Alexandre, why do you need a more recent version than the official 
release?


 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
