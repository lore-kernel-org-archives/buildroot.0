From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 10:07:53 +0200
Subject: [Buildroot] [PATCH 1/1] Bump libubox, libuci to last versions,
 add ubus package
In-Reply-To: <1413098996-358-1-git-send-email-swexru@gmail.com>
References: <1413098996-358-1-git-send-email-swexru@gmail.com>
Message-ID: <20141012100753.7f316941@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Mednyy,

On Sun, 12 Oct 2014 11:29:56 +0400, Alexey Mednyy wrote:
> Signed-off-by: Alexey Mednyy <swexru@gmail.com>
> ---
>  package/Config.in                              |  1 +
>  package/libubox/libubox.mk                     |  2 +-
>  package/libuci/libuci.mk                       |  2 +-
>  package/ubus/Config.in                         | 11 ++++++++++
>  package/ubus/ubus-01-json-definition-fix.patch | 28 ++++++++++++++++++++++++++
>  package/ubus/ubus.mk                           | 26 ++++++++++++++++++++++++
>  6 files changed, 68 insertions(+), 2 deletions(-)
>  create mode 100644 package/ubus/Config.in
>  create mode 100644 package/ubus/ubus-01-json-definition-fix.patch
>  create mode 100644 package/ubus/ubus.mk

Thanks for this submission. However, could you split it in three
patches: one bumping libubox, one bumping libuci, and one adding the
ubus package?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
