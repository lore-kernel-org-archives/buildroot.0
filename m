From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 17:36:07 +0200
Subject: [Buildroot] [PATCH v8 1/4] package/mesa3d: disable opencl
In-Reply-To: <1540046091-13736-2-git-send-email-valentinkorenblit@gmail.com>
References: <1540046091-13736-1-git-send-email-valentinkorenblit@gmail.com>
 <1540046091-13736-2-git-send-email-valentinkorenblit@gmail.com>
Message-ID: <20181020173607.20222f8c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Oct 2018 16:34:48 +0200, Valentin Korenblit wrote:
> Preliminary patch to prevent Mesa from building OpenCL lib as
> soon as libclc is available.
> 
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
> Signed-off-by: Valentin Korenblit <valentinkorenblit@gmail.com>
> ---
>  package/mesa3d/mesa3d.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
