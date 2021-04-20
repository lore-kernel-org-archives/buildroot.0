From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Apr 2021 23:03:27 +0200
Subject: [Buildroot] [PATCH] boot/at91bootstrap: add legal information
In-Reply-To: <20210405153249.1352356-1-thomas.petazzoni@bootlin.com>
References: <20210405153249.1352356-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210420230327.7523c9ae@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  5 Apr 2021 17:32:48 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> The old at91bootstrap version (1.x) uses a strange variant of the BSD
> license, called "BSD Source Code Attribution" and referenced by SPDX
> as BSD-Source-Code.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  boot/at91bootstrap/at91bootstrap.hash | 1 +
>  boot/at91bootstrap/at91bootstrap.mk   | 2 ++
>  2 files changed, 3 insertions(+)

Applied to master after using include/sdramc.h as the license file,
which is much less likely to be changed by local patches.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
