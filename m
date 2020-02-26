From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 20:49:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/vala: bump version to 0.46.6
In-Reply-To: <20200225232826.958260-1-aduskett@gmail.com>
References: <20200225232826.958260-1-aduskett@gmail.com>
Message-ID: <20200226204956.7a6d63e3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 25 Feb 2020 15:28:26 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Also add the line "HOST_VALA_CONF_OPTS += --disable-valadoc"
> as valadoc requires libgvc which is not available in Buildroot.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/vala/vala.hash | 4 ++--
>  package/vala/vala.mk   | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
