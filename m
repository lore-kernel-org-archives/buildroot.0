From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Dec 2014 16:12:15 +0100
Subject: [Buildroot] [PATCH] package/hostapd: use correct include path
 for libnl-3.0
In-Reply-To: <1418771832-14258-1-git-send-email-romain.naour@openwide.fr>
References: <1418771832-14258-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141220161215.264ab952@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Wed, 17 Dec 2014 00:17:12 +0100, Romain Naour wrote:
> Add a dependancy on host-pkgconf.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Reported-by: J?rg Krause <jkrause@posteo.de>
> Cc: J?rg Krause <jkrause@posteo.de>
> ---
>  ...01-use-correct-include-path-for-libnl-3.0.patch | 26 ++++++++++++++++++++++
>  package/hostapd/hostapd.mk                         |  2 +-
>  2 files changed, 27 insertions(+), 1 deletion(-)
>  create mode 100644 package/hostapd/0001-use-correct-include-path-for-libnl-3.0.patch

Applied, thanks. Please submit the patch upstream.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
