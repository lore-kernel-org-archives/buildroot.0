From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 21:33:15 +0200
Subject: [Buildroot] [PATCH] lirc-tools: needs threads
In-Reply-To: <cb6cb178ff004d5c7cad4497fbdacdd83193f967.1428389483.git.baruch@tkos.co.il>
References: <cb6cb178ff004d5c7cad4497fbdacdd83193f967.1428389483.git.baruch@tkos.co.il>
Message-ID: <20150407213315.7814d1b2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue,  7 Apr 2015 09:51:23 +0300, Baruch Siach wrote:
> Fixes:
> http://autobuild.buildroot.net/results/c20/c20a98dfacfa79579a0d401e081f2cca13a7a7b0/
> http://autobuild.buildroot.net/results/0fe/0fe9b4a3a5128844886e4bf89b5bc0d3008b43aa/
> http://autobuild.buildroot.net/results/482/4826409b3d3177eff3e7f2c3b7360058c73fd406/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/lirc-tools/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
