From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jan 2018 22:15:26 +0100
Subject: [Buildroot] [PATCH] daq: fix build when flex and bison are not
 available
In-Reply-To: <1516747079-16281-1-git-send-email-sergio.prado@e-labworks.com>
References: <1516747079-16281-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20180129221526.7e755749@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Jan 2018 20:37:59 -0200, Sergio Prado wrote:
> daq depends on flex and bison to be configured.
> 
> Fixes:
> http://autobuild.buildroot.net/results/43da4ae3b7fc26e6712d369d4d030954d0d85149
> http://autobuild.buildroot.net/results/0fc2bcf9da758f427adf2fddca8ad1dace6a080e
> http://autobuild.buildroot.net/results/7411ac4ae5bef71b78c69b680de2b72f389ad2ee
> ... and many more.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  package/daq/daq.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, after tweaking the commit title. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
