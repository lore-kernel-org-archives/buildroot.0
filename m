From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:43:39 +0200
Subject: [Buildroot] [PATCH] mfgtools: add gcc version dependency
In-Reply-To: <20161028143244.29212-1-gary.bisson@boundarydevices.com>
References: <20161028143244.29212-1-gary.bisson@boundarydevices.com>
Message-ID: <20161029154339.18a273ac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Oct 2016 16:32:44 +0200, Gary Bisson wrote:
> MfgTools requires gcc >= 4.8 since it needs C++11 support.
> 
> Fixes the following autobuild issues:
> http://autobuild.buildroot.net/results/c8cbc4e5296af91be5fa8b17871bedf08b6a2697
> http://autobuild.buildroot.net/results/fadabb38d8dde6f2be85fbc286b060e2f3e82f65
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/mfgtools/Config.in.host | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
