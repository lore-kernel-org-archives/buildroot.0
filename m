From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 23:37:25 +0100
Subject: [Buildroot] [PATCH 3/4] libatkmm: new package
In-Reply-To: <1449178605-8568-3-git-send-email-james.knight@rockwellcollins.com>
References: <1449178605-8568-1-git-send-email-james.knight@rockwellcollins.com>
 <1449178605-8568-3-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20151216233725.5c86f7d2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

On Thu,  3 Dec 2015 16:36:44 -0500, James Knight wrote:
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
>  package/Config.in              |  1 +
>  package/libatkmm/Config.in     | 19 +++++++++++++++++++
>  package/libatkmm/libatkmm.hash |  2 ++
>  package/libatkmm/libatkmm.mk   | 16 ++++++++++++++++
>  4 files changed, 38 insertions(+)
>  create mode 100644 package/libatkmm/Config.in
>  create mode 100644 package/libatkmm/libatkmm.hash
>  create mode 100644 package/libatkmm/libatkmm.mk

Applied, after some changes:

    [Thomas:
     - rename to atkmm
     - move next to atk in menuconfig
     - add dependency to libsigc]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
