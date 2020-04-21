From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 21:44:18 +0200
Subject: [Buildroot] [PATCHv2 02/12] gitlab-ci: check generated config
 files
In-Reply-To: <20200421172646.3340666-2-romain.naour@gmail.com>
References: <20200421172646.3340666-1-romain.naour@gmail.com>
 <20200421172646.3340666-2-romain.naour@gmail.com>
Message-ID: <20200421214418.32dc2994@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Apr 2020 19:26:36 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Use the script added by the previous patch to check
> generated config files.
> 
> Tested on gitlab:
> https://gitlab.com/kubu93/buildroot/pipelines/137597966
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Having this patch at this step of the series would make Gitlab CI
unhappy: this patch should come *after* all defconfigs are fixed.

No need to resend just for that.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
