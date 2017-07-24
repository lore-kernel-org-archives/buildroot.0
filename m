From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jul 2017 18:36:00 +0200
Subject: [Buildroot] [PATCH v3] support/testing: add test of BR2_CCACHE
 with an external toolchain
In-Reply-To: <20170724111626.14712-1-arnout@mind.be>
References: <20170724111626.14712-1-arnout@mind.be>
Message-ID: <20170724183600.7eccf8c7@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Jul 2017 13:16:26 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> We reuse TestExternalToolchainBuildrootuClibc and add ccache to its
> configuration.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Sorry, I forgot to commit before sending, this is the *real* v3.

Applied to master, thanks. However, you forgot to
regenerate .gitlab-ci.yml, so I've done so.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
