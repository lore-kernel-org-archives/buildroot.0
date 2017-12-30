From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Dec 2017 22:49:34 +0100
Subject: [Buildroot] [PATCH] syslog-ng: fix build with newer json-c
In-Reply-To: <353a47c61a55ab31689a812b8f931519cf374ae4.1514669887.git.baruch@tkos.co.il>
References: <353a47c61a55ab31689a812b8f931519cf374ae4.1514669887.git.baruch@tkos.co.il>
Message-ID: <20171230224934.010f60ba@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Dec 2017 23:38:07 +0200, Baruch Siach wrote:
> Add upstream patch fixing build with json-c version 0.13.
> 
> Fixes:
> http://autobuild.buildroot.net/results/e12/e12b88d082f053247863124f4802cafc73278c8c/
> http://autobuild.buildroot.net/results/cdc/cdc941b47fe04e8e99393004b750451490dc8c8e/
> http://autobuild.buildroot.net/results/b85/b854c97b5af5125394246298d010baafa175a4c3/
> 
> Cc: Chris Packham <judge.packham@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...1-modules-json-Adaptions-for-json-c-v0.13.patch | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/syslog-ng/0001-modules-json-Adaptions-for-json-c-v0.13.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
