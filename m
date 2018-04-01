From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 00:43:24 +0200
Subject: [Buildroot] [PATCH v3 1/1] docs/manual: add check-package to
 "Tips and tricks"
In-Reply-To: <20180401223156.18457-1-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-19-ricardo.martincoski@gmail.com>
 <20180401223156.18457-1-ricardo.martincoski@gmail.com>
Message-ID: <20180402004324.245bd285@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 19:31:56 -0300, Ricardo Martincoski wrote:
> And add two references to it: in "Submitting patches" and in "Adding new

> +This script can be used for packages and also for package-like files:
> +boot, fs, toolchain, ...

boot and toolchain stuff are also packages, so I've reworded this a bit:

+This script can be used for packages, filesystem makefiles, Config.in
+files, etc. It does not check the files defining the package
+infrastructures and some other files containing similar common code.

And applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
