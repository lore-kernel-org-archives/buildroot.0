From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jan 2020 15:34:25 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/poppler: bump to version 0.84.0
In-Reply-To: <20200111132424.1086617-1-fontaine.fabrice@gmail.com>
References: <20200111132424.1086617-1-fontaine.fabrice@gmail.com>
Message-ID: <20200111153425.54854e99@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Jan 2020 14:24:24 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop USE_FIXEDPOINT, remove since version 0.80.0 and
>   https://gitlab.freedesktop.org/poppler/poppler/commit/5b81ab6ce06f60daa63029a3eb12cd31d6852799
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Fix trailing whitespace in poppler.hash

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
