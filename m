From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 15:46:20 +0100
Subject: [Buildroot] [PATCH] wpan-tools: new package
In-Reply-To: <1455106406-27284-1-git-send-email-gustavo@zacarias.com.ar>
References: <1455106406-27284-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160220154620.7eb89539@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 10 Feb 2016 09:13:26 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in                                  |  1 +
>  .../0001-fix-build-with-newer-libnl.patch          | 40 ++++++++++++++++++++++
>  package/wpan-tools/Config.in                       | 11 ++++++
>  package/wpan-tools/wpan-tools.hash                 |  4 +++
>  package/wpan-tools/wpan-tools.mk                   | 13 +++++++
>  5 files changed, 69 insertions(+)
>  create mode 100644 package/wpan-tools/0001-fix-build-with-newer-libnl.patch
>  create mode 100644 package/wpan-tools/Config.in
>  create mode 100644 package/wpan-tools/wpan-tools.hash
>  create mode 100644 package/wpan-tools/wpan-tools.mk

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
