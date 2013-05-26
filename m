From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 May 2013 15:04:47 +0200
Subject: [Buildroot] [PATCH v2] toolchain: blackfin: Remove Blackfin
 toolchain 2011R1 release.
In-Reply-To: <1368595963-10671-1-git-send-email-sonic.adi@gmail.com>
References: <1368595963-10671-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <20130526150447.73efde93@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Wed, 15 May 2013 13:32:43 +0800, Sonic Zhang wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>
> 
> ADI officially supports the buildroot and related GNU toolchain for
> Blackfin since ADI's 2012R1 release only. In order to avoid confusion,
> it is better to remove the 2011R1 GNU toolchain for Blackfin. In
> addition, the 2011R1 GNU toolchain for Blackfin doesn't support the
> BF60x processors.
> 
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>

I've taken this patch in one of my branch, which I will submit to Peter
soon.

Peter, no need to take this patch direclty, I'll send it to you with
other changes.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
