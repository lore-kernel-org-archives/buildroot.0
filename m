From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 09:05:49 +0200
Subject: [Buildroot] [PATCH v2] autobuild-run: fix copy_if_exists()
In-Reply-To: <20190530103305.37919-1-giulio.benetti@micronovasrl.com>
References: <20190530103305.37919-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190601090549.319774bb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 30 May 2019 12:33:05 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> Under copy_if_exists() 'dir' variable is referenced as 'd' leading to
> exception.
> 
> Substitute 'd' and 'dir' with 'directory' in copy_if_exists(), since
> 'dir' is a keyword in Python.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
> Changes:
> V1->V2: change 'dir' and 'd' into 'directory'

Applied to buildroot-test, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
