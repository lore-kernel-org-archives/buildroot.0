From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 21:25:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/libxcrypt: disable obsolete API
In-Reply-To: <20210316193037.2613209-1-fontaine.fabrice@gmail.com>
References: <20210316193037.2613209-1-fontaine.fabrice@gmail.com>
Message-ID: <20210316212550.1242bb60@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Mar 2021 20:30:37 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable obsolete API following upstream feedback as it raises build
> failures on some architectures such as nds32le or arc and because this
> API is unsecure: https://github.com/besser82/libxcrypt/issues/122
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/5ae235b6ec66ac86efadaa2847307be58064c167
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libxcrypt/libxcrypt.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
