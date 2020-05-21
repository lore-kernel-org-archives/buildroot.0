From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 May 2020 15:55:52 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/libpam-tacplus: fix build when time_t is 64 bits
In-Reply-To: <20200518161525.2935223-1-fontaine.fabrice@gmail.com>
References: <20200518161525.2935223-1-fontaine.fabrice@gmail.com>
Message-ID: <20200521155552.315bd87a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 May 2020 18:15:25 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/874433d8cb30d21332f23024081a8b6d7b3254ae
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Update patch to avoid a build failure when time_t is 32 bits

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
