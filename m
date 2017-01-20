From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jan 2017 11:26:30 +1100
Subject: [Buildroot] [PATCH] tslib: needs kernel headers 3.12
In-Reply-To: <4a250493e254e7a958267c5ce153f9ef05e6fc69.1484830247.git.baruch@tkos.co.il>
References: <4a250493e254e7a958267c5ce153f9ef05e6fc69.1484830247.git.baruch@tkos.co.il>
Message-ID: <20170120112630.557f297d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Jan 2017 14:50:47 +0200, Baruch Siach wrote:
> Kernel headers 3.12+ are required since tslib version 1.3.
> 
> https://github.com/kergoth/tslib/blob/master/README.markdown
> 
> Update tslib reverse dependencies.
> 
> Fixes:
> http://autobuild.buildroot.net/results/28d/28df38e2a042f1b5940bf35c18334ebf8810a348/
> http://autobuild.buildroot.net/results/c38/c383cfee3673aa9fba36a86f1e68de63413c2987/
> http://autobuild.buildroot.net/results/6dd/6ddb2cd9f4f41ee03dc10a73422ad37070811732/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Isn't this a bit annoying for people using tslib on kernel olders than
3.12 ? Isn't there a simpler patch to tslib to avoid depending on
headers >= 3.12 ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
