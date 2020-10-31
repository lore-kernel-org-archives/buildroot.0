From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 23:44:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/libraw: needs autoreconf
In-Reply-To: <20201028113540.127357-1-fontaine.fabrice@gmail.com>
References: <20201028113540.127357-1-fontaine.fabrice@gmail.com>
Message-ID: <20201031234438.3314abc9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 28 Oct 2020 12:35:40 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> configure is older than configure.ac in official libraw 0.20.2 tarball:
> https://github.com/LibRaw/LibRaw/issues/353
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/abef2ac14a959093a6391cad28e738558e15ceec
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libraw/libraw.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
