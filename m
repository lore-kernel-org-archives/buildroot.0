From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 15:01:29 +0100
Subject: [Buildroot] [PATCH] package/shairport-sync: fix static build
 issue
In-Reply-To: <1455995410-19843-1-git-send-email-joerg.krause@embedded.rocks>
References: <1455995410-19843-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160221150129.2c1184a1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sat, 20 Feb 2016 20:10:10 +0100, J?rg Krause wrote:
> Add a patch from upstream to fix static build issue with linking against openssl
> and alsa.
> 
> Fixes:
> http://autobuild.buildroot.net/results/682/6821605cf12e1a5393c29b30baf00cb0f1e1a451/
> http://autobuild.buildroot.net/results/3cb/3cb79d566e197771d88e317789d05e9f467f4717/
> http://autobuild.buildroot.net/results/9bc/9bcc27461b67e718f49419ba292afd28f1152dc6/
> http://autobuild.buildroot.net/results/75a/75afbec6ba4c4b0ae2c18423a0d7eccf098b2eaa/
> .. and possibly more.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/shairport-sync/shairport-sync.hash | 1 +
>  package/shairport-sync/shairport-sync.mk   | 1 +
>  2 files changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
