From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 22:01:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/openjdk: install header files
 to staging
In-Reply-To: <20200616001243.3285921-1-aduskett@gmail.com>
References: <20200616001243.3285921-1-aduskett@gmail.com>
Message-ID: <20200617220136.7eff18b2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Jun 2020 17:12:43 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> These files are necessary for C or C++ programs to use the native java
> interface (JNI.)
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/openjdk/openjdk.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
