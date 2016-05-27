From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 May 2016 22:32:29 +0200
Subject: [Buildroot] [PATCH] tinyalsa: fix musl build
In-Reply-To: <6d0482c749131f39bcdfe130d4e8ec169fc25921.1464337923.git.baruch@tkos.co.il>
References: <6d0482c749131f39bcdfe130d4e8ec169fc25921.1464337923.git.baruch@tkos.co.il>
Message-ID: <20160527223229.174ca6c3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 27 May 2016 11:32:03 +0300, Baruch Siach wrote:
> Add upstream patch adding missing header include.
> 
> Fixes:
> http://autobuild.buildroot.net/results/042/04259ddbdf24afc507b0f21e1f5ba8738ec492b1/
> http://autobuild.buildroot.net/results/371/371a1eab885d1a6b5b06bdab6c2280b20593eed4/
> http://autobuild.buildroot.net/results/377/37743b3e73fcb0df9fd50113e082eac712c25e35/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...clude-time.h-to-get-struct-timespec-proto.patch | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/tinyalsa/0002-asound.h-include-time.h-to-get-struct-timespec-proto.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
