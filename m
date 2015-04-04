From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 13:40:10 +0200
Subject: [Buildroot] [PATCH v2 7/8] package/ijs: New package ijs 0.35
In-Reply-To: <1427058772-1105-8-git-send-email-olivier.schonken@gmail.com>
References: <1427058772-1105-1-git-send-email-olivier.schonken@gmail.com>
 <1427058772-1105-8-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20150404134010.0cf5566a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

On Sun, 22 Mar 2015 23:12:51 +0200, Olivier Schonken wrote:
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
>  package/Config.in     |  1 +
>  package/ijs/Config.in |  7 +++++++
>  package/ijs/ijs.hash  |  2 ++
>  package/ijs/ijs.mk    | 16 ++++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/ijs/Config.in
>  create mode 100644 package/ijs/ijs.hash
>  create mode 100644 package/ijs/ijs.mk

Applied, after doing some small changes:

    [Thomas:
      - Add BR2_USE_MMU dependency, since fork() is used.
      - Put <pkg>_SOURCE next to <pkg>_VERSION and <pkg>_SITE.
      - Improve comment about why autoreconf is needed.
      - Change the location in menuconfig of the package, "Networking
        applications" didn't seem like an appropriate location.]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
