From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Sep 2019 21:49:33 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] qt5base: Add patch to
 fix compile issue with gcc9
In-Reply-To: <20190919073529.30254-1-julien.beraud@orolia.com>
References: <20190919073529.30254-1-julien.beraud@orolia.com>
Message-ID: <20190919214933.58202b9f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 19 Sep 2019 07:36:05 +0000
Julien B?raud <julien.beraud@orolia.com> wrote:

> Backport:
> https://github.com/qt/qtbase/commit/a52d7861edfb5956de38ba80015c4dd0b596259b#diff-0b4819f9df9c43297ba840d1ac401599
> Signed-off-by: Julien Beraud <julien.beraud@orolia.com>

With an extended commit log explaining that it fixes an issue when
building Qt5 on a machine with gcc9 as its system compiler, and a blank
line before the SoB:

Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(I actually had the exact same patch sitting around in one of my
branch, as I encountered the same issue working on 2019.02 Qt5 project)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
