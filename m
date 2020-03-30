From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Mar 2020 07:25:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/rng-tools: fix redefinition of
 encrypt
In-Reply-To: <20200329222150.95147-1-fontaine.fabrice@gmail.com>
References: <20200329222150.95147-1-fontaine.fabrice@gmail.com>
Message-ID: <20200330072522.1b3c1f62@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Mar 2020 00:21:50 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/bb7dbd5a76c1ecd2a1d205f4a1c391095e653886
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ..._jitter-disambiguate-call-to-encrypt.patch | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 package/rng-tools/0002-rngd_jitter-disambiguate-call-to-encrypt.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
