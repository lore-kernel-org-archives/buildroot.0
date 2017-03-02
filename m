From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 22:31:43 +0100
Subject: [Buildroot] [PATCH 02/25] cosmo: remove broken package
In-Reply-To: <20170223170047.24417-3-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
 <20170223170047.24417-3-arnout@mind.be>
Message-ID: <20170302223143.1b62253b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Feb 2017 18:00:24 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The cosmo package has been marked as broken for two and a half years
> now, and nobody cared. Get rid of it.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/Config.in        |  1 -
>  package/cosmo/Config.in  | 10 ----------
>  package/cosmo/cosmo.hash |  2 --
>  package/cosmo/cosmo.mk   | 10 ----------
>  4 files changed, 23 deletions(-)
>  delete mode 100644 package/cosmo/Config.in
>  delete mode 100644 package/cosmo/cosmo.hash
>  delete mode 100644 package/cosmo/cosmo.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
