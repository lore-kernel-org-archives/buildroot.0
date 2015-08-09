From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Aug 2015 11:43:38 +0200
Subject: [Buildroot] [PATCH next 1/5] znc: bump to version 1.6.1
In-Reply-To: <1438954654-11777-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438954654-11777-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150809114338.17e73fc7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri,  7 Aug 2015 10:37:30 -0300, Gustavo Zacarias wrote:
> Bump to release tarball version.
> Add hash file.
> Update and rework time.h patch for upstream inclusion (hopefully) by
> splitting the CSocket patch out.
> (https://github.com/znc/znc/pull/1021)
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...0001-Add-time.h-includes-where-appropiate.patch | 194 +++++++++++++
>  package/znc/0001-time.patch                        | 303 ---------------------
>  package/znc/0002-csocket-timeh.patch               |  19 ++
>  package/znc/Config.in                              |   5 +-
>  package/znc/znc.hash                               |   2 +
>  package/znc/znc.mk                                 |  17 +-
>  6 files changed, 223 insertions(+), 317 deletions(-)
>  create mode 100644 package/znc/0001-Add-time.h-includes-where-appropiate.patch
>  delete mode 100644 package/znc/0001-time.patch
>  create mode 100644 package/znc/0002-csocket-timeh.patch
>  create mode 100644 package/znc/znc.hash

All five patches applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
