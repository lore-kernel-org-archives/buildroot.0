From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Apr 2021 22:46:10 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/skalibs: fix build with xtensa
In-Reply-To: <20210411152014.254121-1-fontaine.fabrice@gmail.com>
References: <20210411152014.254121-1-fontaine.fabrice@gmail.com>
Message-ID: <20210421224610.4f55a42e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 11 Apr 2021 17:20:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Build with xtensa toolchain is broken since bump to version 2.10.0.2 in
> commit 4d5587cb56224b2b28f53b0202fb14b2ab32d5fb indeed patch was dropped
> assuming that it was included upstream but this assumption was wrong.
> 
> The code was just reworked in version 2.10.0.0 and commit
> https://github.com/skarnet/skalibs/commit/21e6ea800cc96ba76e94ad8de1dfa58ab1b7ceb6
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ee58ffa7b2f0be46ef7bc0ba38d3142f26a9bce9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Use upstream patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
