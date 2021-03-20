From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 22:52:36 +0100
Subject: [Buildroot] [PATCH 1/1] configs/bananapi_m1_plus_defconfig:
 select custom headers
In-Reply-To: <20210317151647.699472-1-fskoneczny@gmail.com>
References: <20210317151647.699472-1-fskoneczny@gmail.com>
Message-ID: <20210320225236.08bb5c52@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 17 Mar 2021 16:16:47 +0100
Filip Skoneczny <fskoneczny@gmail.com> wrote:

> Board used custom Kernel but did not specify
> custom headers. This broke the build when
> Linux 5.11 was added in d2fe9c6.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1089053980
> 
> Signed-off-by: Filip Skoneczny <fskoneczny@gmail.com>
> ---
>  configs/bananapi_m1_plus_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
