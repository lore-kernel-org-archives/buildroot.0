From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 15:45:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/rng-tools: bump to version 6.10
In-Reply-To: <20200327214628.895444-1-fontaine.fabrice@gmail.com>
References: <20200327214628.895444-1-fontaine.fabrice@gmail.com>
Message-ID: <20200329154553.27ce0f5e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 27 Mar 2020 22:46:28 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - libgcrypt is not an optional dependency and openssl is mandatory since
>   https://github.com/nhorman/rng-tools/commit/699a404c290eaa08ed5dd37204d951ef6ee23578
> - librtlsdr is an optional dependency since
>   https://github.com/nhorman/rng-tools/commit/865277d591e20b7e21873433fb2a280c66d98c87
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-configure.ac-fix-with-rtlsdr-option.patch | 29 +++++++++++++++++++
>  package/rng-tools/Config.in                   |  4 +--
>  package/rng-tools/rng-tools.hash              |  2 +-
>  package/rng-tools/rng-tools.mk                | 11 +++----
>  4 files changed, 37 insertions(+), 9 deletions(-)
>  create mode 100644 package/rng-tools/0001-configure.ac-fix-with-rtlsdr-option.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
