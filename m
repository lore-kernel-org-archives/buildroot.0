From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 14:43:00 +0100
Subject: [Buildroot] [PATCH v4 05/17] python-pynacl: new package
In-Reply-To: <1454799603-5474-6-git-send-email-mc5686@mclink.it>
References: <1454799603-5474-1-git-send-email-mc5686@mclink.it>
 <1454799603-5474-6-git-send-email-mc5686@mclink.it>
Message-ID: <20160220144300.0d1e791b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mauro Condarelli,

On Sat,  6 Feb 2016 23:59:51 +0100, Mauro Condarelli wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> 
> ---
> Changes v3 -> v4
>   - removed spurious "source" line in package/Config.in (suggested by T.Petazzoni)

I've applied to next, after doing the following changes:

[Thomas:
 - remove python-six from the build dependencies, it is only a runtime
   dependency
 - add host-python-cffi in the build dependencies.]

Please try to build your new packages with just that package enabled,
in order to catch missing dependencies.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
