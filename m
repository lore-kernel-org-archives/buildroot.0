From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 17:54:43 +0200
Subject: [Buildroot] [PATCH v5 2/5] barebox: introduce barebox-package
 function
In-Reply-To: <9431c910cd145263e04a01f0a332555b9212e22e.1461489060.git.pieter@boesman.nl>
References: <cover.1461489060.git.pieter@boesman.nl>
 <9431c910cd145263e04a01f0a332555b9212e22e.1461489060.git.pieter@boesman.nl>
Message-ID: <20160424175443.2e0104f2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Apr 2016 11:18:44 +0200, Pieter Smith wrote:
> No functional changes: Introduces a barebox-package function towards re-use by
> a 2nd config build.
> 
> Because the function is meant to be called from within a $(eval), all instances
> of '$' has to be escaped. I.e. rename '$' -> '$$'.
> 
> Signed-off-by: Pieter Smith <pieter@boesman.nl>
> ---
>  boot/barebox/barebox.mk | 125 ++++++++++++++++++++++++++++--------------------
>  1 file changed, 72 insertions(+), 53 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
