From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Aug 2014 20:08:08 +0200
Subject: [Buildroot] [PATCH 1/3] package/libevas-generic-loaders: needs
 zlib
In-Reply-To: <1408899186-28542-1-git-send-email-romain.naour@openwide.fr>
References: <1408899186-28542-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20140825200808.2df85047@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun, 24 Aug 2014 18:53:04 +0200, Romain Naour wrote:
> Fixes:
> http://autobuild.buildroot.net/results/5d4/5d41cec63a15dc5f31460c8cecd6054119ddb1fc/build-end.log
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/efl/libevas-generic-loaders/Config.in                  | 1 +
>  package/efl/libevas-generic-loaders/libevas-generic-loaders.mk | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
