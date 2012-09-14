From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 14 Sep 2012 09:44:47 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2012-09-13
In-Reply-To: <20120914063234.2AD8852D5BE@lolut.humanoidz.org>
References: <20120914063234.2AD8852D5BE@lolut.humanoidz.org>
Message-ID: <20120914064447.GE4504@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Fri, Sep 14, 2012 at 08:32:34AM +0200, Thomas Petazzoni wrote:
> Build 20ae8ff4714ad207912ed4cf193122629fca9401
> ==============================================
> 
> Status         : NOK
> Failure reason : poco-1.4.3p1
> Architecture   : arm
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2012-09-13 07:40:50
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=c8573284cd9ee0f93cd9740fd6472d09357ffb91
> End of log     : http://autobuild.buildroot.net/results/20ae8ff4714ad207912ed4cf193122629fca9401/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/20ae8ff4714ad207912ed4cf193122629fca9401/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/20ae8ff4714ad207912ed4cf193122629fca9401/config
> Defconfig      : http://autobuild.buildroot.net/results/20ae8ff4714ad207912ed4cf193122629fca9401/defconfig

The patch at http://patchwork.ozlabs.org/patch/180652/ should fix this build 
failure. Any chance of having it applied?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
