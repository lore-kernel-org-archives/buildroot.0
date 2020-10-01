From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Oct 2020 10:53:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/keyutils: fix build without C++
In-Reply-To: <20201001064613.337112-1-fontaine.fabrice@gmail.com>
References: <20201001064613.337112-1-fontaine.fabrice@gmail.com>
Message-ID: <20201001105340.01d47c25@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  1 Oct 2020 08:46:13 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Create cxx.stamp to disable the check that keyutils.h has a valid C++
> syntax that has been added with
> https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git/commit/?id=991c272062a4300bbd5fe22dce17ab2fb5126e3f
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/53ec9ca02798a88cd9ab773af10fc8f44ce9d1a2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/keyutils/keyutils.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
