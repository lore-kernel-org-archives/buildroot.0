From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 23:23:34 +0100
Subject: [Buildroot] [PATCH 3/5] package/shairport-sync: add audio DSP
 convolution option
In-Reply-To: <20191203105341.1232360-3-joerg.krause@embedded.rocks>
References: <20191203105341.1232360-1-joerg.krause@embedded.rocks>
 <20191203105341.1232360-3-joerg.krause@embedded.rocks>
Message-ID: <20191208232334.6df27d04@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  3 Dec 2019 11:53:39 +0100
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Already in version 3.1, shairport-sync added audio DSP convolution support. This
> optional feature requires the sndfile library.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/shairport-sync/Config.in         | 6 ++++++
>  package/shairport-sync/shairport-sync.mk | 5 +++++
>  2 files changed, 11 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
