From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Jul 2018 11:08:24 +0200
Subject: [Buildroot] [PATCH 1/1] ncmpc: bump to version 0.30
In-Reply-To: <20180723174345.29552-1-fontaine.fabrice@gmail.com>
References: <20180723174345.29552-1-fontaine.fabrice@gmail.com>
Message-ID: <20180727110824.262654c4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 Jul 2018 19:43:45 +0200, Fabrice Fontaine wrote:
> Since this version, ncmpc depends on C++14:
> https://github.com/MusicPlayerDaemon/ncmpc/commit/aea91692b05e7c2cd2e1b09cf10b0196e3527807
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This update is causing a number of build failures:

  http://autobuild.buildroot.net/?reason=ncmpc-0.30

Could you have a look ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
