From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 21:19:48 +0100
Subject: [Buildroot] [PATCH/next 1/6] package/bctoolbox: bump to version
 4.4.8
In-Reply-To: <20201117201703.137790-1-fontaine.fabrice@gmail.com>
References: <20201117201703.137790-1-fontaine.fabrice@gmail.com>
Message-ID: <20210102211948.4e80a593@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 17 Nov 2020 21:16:58 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/bctoolbox/bctoolbox.hash | 2 +-
>  package/bctoolbox/bctoolbox.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

You had forgotten to test legal-info... and it broke. The hash has
changed, and for a good reason: the license was changed from GPL-2.0+
to GPL-3.0+. I have fixed that and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
