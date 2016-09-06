From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 22:25:10 +0200
Subject: [Buildroot] [PATCH v2] openal: Explicitly enable/disable NEON
 support
In-Reply-To: <1472754894-6903-1-git-send-email-nerv@dawncrow.de>
References: <1472754894-6903-1-git-send-email-nerv@dawncrow.de>
Message-ID: <20160906222510.17123fa6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  1 Sep 2016 20:34:54 +0200, Andr? Hentschel wrote:
> Fixes:
> http://autobuild.buildroot.net/results/d7ccef77a355ccc23f26d012e8441af931469ae4
> http://autobuild.buildroot.net/results/b5777a0ed33f6bb7a5fc0486ea21ecef58615dac
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>

What about instead:

  https://github.com/kcat/openal-soft/pull/64

to fix this issue (I tested, it fixes the build failure).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
