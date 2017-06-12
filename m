From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jun 2017 22:45:22 +0200
Subject: [Buildroot] [PATCH] [PATCH v3] azure-iot-sdk-c: New package
In-Reply-To: <1497297091-28452-1-git-send-email-nerv@dawncrow.de>
References: <1497297091-28452-1-git-send-email-nerv@dawncrow.de>
Message-ID: <20170612224522.20315f78@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Jun 2017 21:51:31 +0200, Andr? Hentschel wrote:
> I use 2017-05-05 now, because newer versions will need some fixes (maybe as patches), so let's start with a cleaner version that just works.

Don't use "personal" sentences in commit logs, and rewrap commit logs
at 72 characters. So something like:

"""

Despite newer versions being available, this patch creates a package
for version 2017-05-05, because newer version have issues that need to
be addressed.

"""

> Still, the projects install target installs the wrong files, that's
> why commands are needed for staging_install and target_install.

Isn't it better to patch the package build system to fix those issues?

> 
> v2: Rework the package with help from Arnouts comments
> v3: Explain some things in the commit message

The commit log should go...

> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---

... here.

I typically do that by putting "---" below my SoB line, and writing the
commit log (git commit --amend).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
