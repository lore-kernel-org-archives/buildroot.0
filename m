From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 21:33:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/vtun: fix static linking with
 atomic
In-Reply-To: <20191010175628.4518-1-fontaine.fabrice@gmail.com>
References: <20191010175628.4518-1-fontaine.fabrice@gmail.com>
Message-ID: <20191010213335.4c53deca@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 10 Oct 2019 19:56:28 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/908707cdd16c5b89197c226a3e259f8943a5474e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/vtun/vtun.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Applied to master, thanks. However, it would really be nicer for the
upstream configure.in to use pkg-config if available, not just for
OpenSSL, but also for its other dependencies.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
