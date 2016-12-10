From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 10 Dec 2016 21:51:44 +0200
Subject: [Buildroot] [Patch v2 6/9] s6-rc: new package
In-Reply-To: <1481397650-14664-7-git-send-email-eric.le.bihan.dev@free.fr>
References: <1481397650-14664-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1481397650-14664-7-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20161210195144.bdoczlscimsl5ocz@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

On Sat, Dec 10, 2016 at 08:20:47PM +0100, Eric Le Bihan wrote:
> This new package provides s6-rc, a service manager for s6-based systems,
> i.e. a suite of programs that can start and stop services, both
> long-running daemons and one-time initialization scripts, in the proper
> order according to a dependency tree.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

[...]

> +$(eval $(generic-package))
> +$(eval $(host-generic-package))

What do you need the host build for? As far as I can see, no package in this 
series uses it.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
