From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 16:02:16 +0100
Subject: [Buildroot] [PATCH v6 2/6] package/polkit: support different
 authentication frameworks
In-Reply-To: <20191206234649.3972927-2-aduskett@gmail.com>
References: <20191206234649.3972927-1-aduskett@gmail.com>
 <20191206234649.3972927-2-aduskett@gmail.com>
Message-ID: <20191208160216.14c877af@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Dec 2019 15:46:45 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Use pam if available, otherwise use shadow.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/polkit/polkit.mk | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
