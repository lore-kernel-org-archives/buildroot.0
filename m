From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 15:39:39 +0200
Subject: [Buildroot] [PATCH] swupdate: bump to version 2017.07
In-Reply-To: <20170727103706.3580-1-joerg.krause@embedded.rocks>
References: <20170727103706.3580-1-joerg.krause@embedded.rocks>
Message-ID: <20170729153939.5bb94374@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Jul 2017 12:37:06 +0200, J?rg Krause wrote:
> * Remove patch applied upstream
> * Update the default config file
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...1-suricata_hawkbit-depends-on-HAVE_JSON_C.patch | 39 ----------------------
>  package/swupdate/swupdate.config                   | 29 ++++++++++------
>  package/swupdate/swupdate.hash                     |  2 +-
>  package/swupdate/swupdate.mk                       |  2 +-
>  4 files changed, 20 insertions(+), 52 deletions(-)
>  delete mode 100644 package/swupdate/0001-suricata_hawkbit-depends-on-HAVE_JSON_C.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
