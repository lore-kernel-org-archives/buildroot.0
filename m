From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 11 Aug 2018 21:59:47 -0300
Subject: [Buildroot] [PATCH v2] Makefile: introduce check-package target
References: <20180811104423.31391-1-thomas.petazzoni@bootlin.com>
Message-ID: <5b6f8683ae7c7_79012ab66f6c5a0c17714@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Aug 11, 2018 at 07:44 AM, Thomas Petazzoni wrote:

> The snippet of code that runs a check-package on all
> .mk/.hash/Config.in files is currently only available within
> .gitlab-ci.yml, and isn't immediately and easily usable by Buildroot
> users. In order to simplify this, this commit introduces a top-level
> "check-package" make target that implements the same logic. The
> .gitlab-ci.yml file is changed to use "make check-package".
> 
> Since this target is oriented towards Buildroot developers, we
> intentionally do not clutter the already noisy "make help" text with
> this additional make target.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>


Regards,
Ricardo
