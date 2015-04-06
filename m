From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 10:58:20 +0200
Subject: [Buildroot] [PATCH] lirc-tools: fix build with host python3
In-Reply-To: <7a4adf12aeaac9866b488af01bf8e3e8aaf58f5e.1428295522.git.baruch@tkos.co.il>
References: <7a4adf12aeaac9866b488af01bf8e3e8aaf58f5e.1428295522.git.baruch@tkos.co.il>
Message-ID: <20150406105820.6e80b278@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon,  6 Apr 2015 07:45:22 +0300, Baruch Siach wrote:
> Add an upstream patch making make_rel_symlink.py python3 compatible. Add
> another patch that removes python3 dependency.
> 
> Fixes:
> http://autobuild.buildroot.net/results/6c6/6c6e014a751650c16d25dfd3d673bd3199c72b2e/
> http://autobuild.buildroot.net/results/857/85724dfd014cec5a80dd18a635826daa2edc1417/
> http://autobuild.buildroot.net/results/a74/a74563f700a47065ffd1ba42c83c2d7722bacd89/
> 
> and many others.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
