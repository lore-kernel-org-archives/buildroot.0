From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Mar 2019 22:11:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/libglib2: check for selinux
In-Reply-To: <20190319153149.84900-1-aduskett@gmail.com>
References: <20190319153149.84900-1-aduskett@gmail.com>
Message-ID: <20190319221121.5c33503b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 19 Mar 2019 11:31:49 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> If libselinux is selected, explicitly set --enable-selinux in the configure
> options and build the library first.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/libglib2/libglib2.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
