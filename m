From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jan 2015 22:37:40 +0100
Subject: [Buildroot] [PATCH] start-stop-daemon: fix build on non listed
 architectures
In-Reply-To: <80da3f9ea8ed6a75fbd4cbafb1e43843671cd8f0.1421385033.git.baruch@tkos.co.il>
References: <80da3f9ea8ed6a75fbd4cbafb1e43843671cd8f0.1421385033.git.baruch@tkos.co.il>
Message-ID: <20150116223740.424be322@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Fri, 16 Jan 2015 07:10:33 +0200, Baruch Siach wrote:
> Not all Buildroot supported architectures are known to dpkg. Convert the
> configure error to a warning.
> 
> Fixes:
> http://autobuild.buildroot.net/results/24e/24e37550749dc15ed7223fd515fa4628803f341e/
> http://autobuild.buildroot.net/results/445/445bf4742d78a0bf93b4c75dc733c4315530031e/
> http://autobuild.buildroot.net/results/952/952051485f23b67ffc449360886d6757c385331f/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
