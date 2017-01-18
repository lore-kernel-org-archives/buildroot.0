From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Jan 2017 21:40:22 +1100
Subject: [Buildroot] [PATCH 2/2] package/ltp-testsuite: update configure
 flags
In-Reply-To: <20170118101236.24594-2-petr.vorel@gmail.com>
References: <20170118101236.24594-1-petr.vorel@gmail.com>
 <20170118101236.24594-2-petr.vorel@gmail.com>
Message-ID: <20170118214022.064bd5fe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Jan 2017 11:12:36 +0100, Petr Vorel wrote:
> compile also open possix
> 
> remove power management (compiled by default since commit
> b74bbed51b0c0d44b70b136326a8a23cbc64db01)
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Is this directly related to the ltp-testsuite version bump ? If that's
the case, then it should be in the same patch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
