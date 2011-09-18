From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 18 Sep 2011 22:32:12 +0200
Subject: [Buildroot] [PATCH 1/8] linux: Add Linux Kernel extensions menu
In-Reply-To: <ce82814ab1e4373f4328e235305f9d331066886a.1316290714.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 17 Sep 2011 22:22:51 +0200")
References: <cover.1316290714.git.thomas.petazzoni@free-electrons.com>
 <cover.1316290714.git.thomas.petazzoni@free-electrons.com>
 <ce82814ab1e4373f4328e235305f9d331066886a.1316290714.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ty897fsj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
 Thomas> Add a kernel sub-menu (called "Linux Kernel Extensions"), which makes
 Thomas> possible to patch it or tweak the kernel build step.

 Thomas>  * All linux/linux-ext-*.mk files will be read by the make process.
 Thomas>  * The menu can be customized in "linux/Config.ext.in".

 Thomas> +# Linux extensions (Xenomai)
 Thomas> +source "linux/Config.ext.in"

That comments doesn't belong here if we want it to be a generic
extension support.

Other than that it looks good - Committed, thanks.

-- 
Bye, Peter Korsgaard
