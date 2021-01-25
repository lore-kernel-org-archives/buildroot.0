From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 22:15:37 +0100
Subject: [Buildroot] [PATCH 1/2] package/uboot-tools: resolve uboot env
 source file error
In-Reply-To: <20210125145742.42460-1-matthew.weber@rockwellcollins.com>
References: <20210125145742.42460-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210125221537.5cb4dbdd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Jan 2021 08:57:41 -0600
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> From: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
> 
> If Target u-boot is not available, the host build of uboot-tools
> requires user to provide u-boot environment source file.
> This change resolves a missing parentheses and updates the comment
> for the same.
> 
> Signed-off-by: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/uboot-tools/uboot-tools.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks. I think this bug really shows we need some
unit tests for this uboot-tools package functionality, in
supporting/testing/.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
