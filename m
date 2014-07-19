From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 11:42:19 +0200
Subject: [Buildroot] [PATCH v2 1/1] ti-gfx: add patch to fix build
 failure with es5.x
In-Reply-To: <1405701996-25351-1-git-send-email-hadrien.boutteville@gmail.com>
References: <1405701996-25351-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <20140719114219.6f5fdfa2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hadrien Boutteville,

On Fri, 18 Jul 2014 18:46:36 +0200, Hadrien Boutteville wrote:
> Since commit a73fdc647417699833f22d0f239affe22e062827 in the kernel,
> omap_dss_device's 'output' is renamed 'src'.
> 
> Build with es5.x fails because ti-gfx still uses 'output'.
> 
> Fix build with at least es5.x selected (AM35xx).
> 
> Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
