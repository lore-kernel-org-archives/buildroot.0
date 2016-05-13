From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 23:34:27 +0200
Subject: [Buildroot] [PATCH] lft: new package
In-Reply-To: <1462300214-8562-1-git-send-email-gustavo@zacarias.com.ar>
References: <1462300214-8562-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160513233427.43dbe4e1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  3 May 2016 15:30:14 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in                |  1 +
>  package/lft/0001-no-strip.patch  | 19 +++++++++++++++++++
>  package/lft/0002-no-incdir.patch | 27 +++++++++++++++++++++++++++
>  package/lft/Config.in            | 10 ++++++++++
>  package/lft/lft.hash             |  2 ++
>  package/lft/lft.mk               | 19 +++++++++++++++++++
>  6 files changed, 78 insertions(+)
>  create mode 100644 package/lft/0001-no-strip.patch
>  create mode 100644 package/lft/0002-no-incdir.patch
>  create mode 100644 package/lft/Config.in
>  create mode 100644 package/lft/lft.hash
>  create mode 100644 package/lft/lft.mk

I've changed the license name from VOSCOM to the more complete "VOSTROM
Public License for Open Source", which is the complete license name
found in the COPYING file. And then I've applied to next. Thanks!

I guess the chance of seeing the patches merged upstream is pretty
small, unfortunately :/ Have you talked with upstream about the silly
form-based download method?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
