From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 09:01:24 +0200
Subject: [Buildroot] [PATCH v7 14/23] minimal.config: add
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
In-Reply-To: <20170721010530.4747-15-arnout@mind.be>
References: <20170721010530.4747-1-arnout@mind.be>
 <20170721010530.4747-15-arnout@mind.be>
Message-ID: <20170721090124.4d66f46c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Jul 2017 03:05:21 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The user shouldn't need to pass this manually when creating a test-pkg
> config file. It's an absolutely harmless option to enable always.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> v7: new patch
> ---
>  support/config-fragments/minimal.config | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
