From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 May 2013 20:48:19 +0200
Subject: [Buildroot] [PATCH v7 6/7] arch: toolchain: Install blackfin
 FDPIC and FLAT libraries in external toolchain makefile.
In-Reply-To: <1367577580-3518-6-git-send-email-sonic.adi@gmail.com>
References: <1367577580-3518-1-git-send-email-sonic.adi@gmail.com>
 <1367577580-3518-6-git-send-email-sonic.adi@gmail.com>
Message-ID: <20130503204819.40b01da9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Fri, 3 May 2013 18:39:39 +0800, Sonic Zhang wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>
> 
> Reserve all 3 blackfin toolchain folders under the TOOLCHAIN_EXTERNAL_DIR.
> Set current blackfin toolchain bin folder to the toolchain prefix subfolder.
> Install FDPIC and FLAT library in target ext-toolchain-installed.
> 
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>

Something strange is going in this patch, I can't apply it. git
complains that it lacks some repository informations.

Is your branch containing those 7 patches really based on Buildroot
master?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
