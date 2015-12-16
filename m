From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 22:59:50 +0100
Subject: [Buildroot] [PATCH 2/4] libpangomm: new package
In-Reply-To: <1449178605-8568-2-git-send-email-james.knight@rockwellcollins.com>
References: <1449178605-8568-1-git-send-email-james.knight@rockwellcollins.com>
 <1449178605-8568-2-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20151216225950.61f9e939@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

On Thu,  3 Dec 2015 16:36:43 -0500, James Knight wrote:
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
>  package/Config.in                  |  1 +
>  package/libpangomm/Config.in       | 21 +++++++++++++++++++++
>  package/libpangomm/libpangomm.hash |  2 ++
>  package/libpangomm/libpangomm.mk   | 16 ++++++++++++++++
>  4 files changed, 40 insertions(+)
>  create mode 100644 package/libpangomm/Config.in
>  create mode 100644 package/libpangomm/libpangomm.hash
>  create mode 100644 package/libpangomm/libpangomm.mk

Applied, after doing some changes:

    [Thomas:
     - rename to pangomm.
     - move next to pango in menuconfig.
     - add dependency to libsigc.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
