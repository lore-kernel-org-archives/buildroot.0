From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 23:21:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/efl: drop dependency on gcc >=
 4.8
In-Reply-To: <20210129174337.1015111-1-fontaine.fabrice@gmail.com>
References: <20210129174337.1015111-1-fontaine.fabrice@gmail.com>
Message-ID: <20210131232100.5d1a9090@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 29 Jan 2021 18:43:37 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop dependency on gcc >= 4.8 for efl options as it is guaranted since
> commit dbe2d2e686281c19739824d4d4faec62187d1779 which added a dependency
> on gcc >= 4.9 for efl
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/efl/Config.in | 10 ----------
>  1 file changed, 10 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
