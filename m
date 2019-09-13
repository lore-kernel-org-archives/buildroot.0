From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Sep 2019 22:33:52 +0200
Subject: [Buildroot] [PATCH 1/2] package/nghttp2: security bump to
 version 1.39.2
In-Reply-To: <20190912194354.27963-1-peter@korsgaard.com>
References: <20190912194354.27963-1-peter@korsgaard.com>
Message-ID: <20190913223352.6a310d2d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 12 Sep 2019 21:43:53 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issues:
> 
> CVE-2019-9511: Data Dribble
> CVE-2019-9513: Resource Loop
> 
> For details, see the advisory:
> https://nghttp2.org/blog/2019/08/19/nghttp2-v1-39-2/
> 
> Notice that libnghttp2 itself is not affected by these vulnerabilities, only
> nghttpx and nghttpd (which are currently not built).
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/nghttp2/nghttp2.hash | 2 +-
>  package/nghttp2/nghttp2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
