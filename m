From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 09:01:15 +0200
Subject: [Buildroot] [PATCH v7 12/23] support/test-pkg: move
 minimal.config into a separate file
In-Reply-To: <20170721010530.4747-13-arnout@mind.be>
References: <20170721010530.4747-1-arnout@mind.be>
 <20170721010530.4747-13-arnout@mind.be>
Message-ID: <20170721090115.02823f20@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Jul 2017 03:05:19 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> This minimal configuration is also very useful outside test-pkg. In
> addition, it will simplify the config merge in a later patch.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
> v7: Re-ordered the patch
> v6: Use support/config-fragments instead of support/misc
> v5: First version
> ---
>  support/config-fragments/minimal.config | 6 ++++++
>  utils/test-pkg                          | 8 +-------
>  2 files changed, 7 insertions(+), 7 deletions(-)
>  create mode 100644 support/config-fragments/minimal.config

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
