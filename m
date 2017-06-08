From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 21:31:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/bdwgc: re-add fix for pthread
 detection on uclinux platforms
In-Reply-To: <20170602180434.991-1-bernd.kuhls@t-online.de>
References: <20170602180434.991-1-bernd.kuhls@t-online.de>
Message-ID: <20170608213109.24ba6e92@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Jun 2017 20:04:34 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/d63/d63ee2d03421cc671455be553ab35ada7ff78267/
> http://autobuild.buildroot.net/results/d8f/d8f97fd92cd971a0d125f983765ef27c5ac87acb/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> Apparently I misread the github changelog: our uclinux patch was not
> applied to the 7.6.0 release, we still need the backported patch, sorry.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
