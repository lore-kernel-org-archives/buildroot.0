From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 20:58:01 +0200
Subject: [Buildroot] [PATCH] libssh: bump to version 0.8.3
In-Reply-To: <8eb7618e47431841480d1d3aea2fd653cad2956e.1539283600.git.baruch@tkos.co.il>
References: <8eb7618e47431841480d1d3aea2fd653cad2956e.1539283600.git.baruch@tkos.co.il>
Message-ID: <20181011205801.007173dc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Oct 2018 21:46:40 +0300, Baruch Siach wrote:
> Drop GNU glob detection patch; issue fixed upstream.
> 
> Add upstream patch that completes the build fix when GNU glob is not
> present.
> 
> Cc: Scott Fan <fancp2007@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...heck-for-GNU-compatible-glob-support.patch | 44 -------------------
>  ...ix-building-without-globbing-support.patch | 30 +++++++++++++
>  package/libssh/libssh.hash                    |  4 +-
>  package/libssh/libssh.mk                      |  2 +-
>  4 files changed, 34 insertions(+), 46 deletions(-)
>  delete mode 100644 package/libssh/0001-cmake-check-for-GNU-compatible-glob-support.patch
>  create mode 100644 package/libssh/0001-config-Fix-building-without-globbing-support.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
