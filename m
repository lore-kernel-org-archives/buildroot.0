From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 22:30:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/midori: needs gcc >= 7
In-Reply-To: <20200421172632.4124853-1-fontaine.fabrice@gmail.com>
References: <20200421172632.4124853-1-fontaine.fabrice@gmail.com>
Message-ID: <20200421223000.5b0aa11c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Apr 2020 19:26:32 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit ec1ff802df9a0f17dd2b734ba536a5e206aa5aa4 forgot to propagate
> gcc >= 7 dependency to midori
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/736a99dcaa72fba3f06775d08c4395f506fce944
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/midori/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
