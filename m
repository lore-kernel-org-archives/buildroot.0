From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 21:40:41 +0200
Subject: [Buildroot] [PATCH] collect: fix build with latest gpsd
In-Reply-To: <72fea15defb00f67c15ccef164dfa1a2c7e36a43.1539105491.git.baruch@tkos.co.il>
References: <72fea15defb00f67c15ccef164dfa1a2c7e36a43.1539105491.git.baruch@tkos.co.il>
Message-ID: <20181009214041.2e785d82@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Oct 2018 20:18:11 +0300, Baruch Siach wrote:
> The last bump of gpsd to version 3.18 broke the build due to a change in
> the gps_read() prototype. Add a patch fixing that.
> 
> Fixes:
> http://autobuild.buildroot.net/results/b08/b0829bc3343d6dc3065078e94896725b1c808bc1/
> http://autobuild.buildroot.net/results/1a6/1a6f2fcf1a88ecc5b598dd11c5914dcacf0e1e6b/
> http://autobuild.buildroot.net/results/63a/63a4f980d7cdb4b0823840f747589803fcd0d69f/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...gps-plugin-fix-build-with-newer-gpsd.patch | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/collectd/0002-gps-plugin-fix-build-with-newer-gpsd.patch

Applied to master after s/collect/collectd/ in the commit title, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
