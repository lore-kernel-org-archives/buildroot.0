From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 23:37:42 +0100
Subject: [Buildroot] [PATCH 4/4] libgtkmm30: new package
In-Reply-To: <1449178605-8568-4-git-send-email-james.knight@rockwellcollins.com>
References: <1449178605-8568-1-git-send-email-james.knight@rockwellcollins.com>
 <1449178605-8568-4-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20151216233742.6a3224ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

On Thu,  3 Dec 2015 16:36:45 -0500, James Knight wrote:
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
>  package/Config.in                  |  1 +
>  package/libgtkmm30/Config.in       | 23 +++++++++++++++++++++++
>  package/libgtkmm30/libgtkmm30.hash |  2 ++
>  package/libgtkmm30/libgtkmm30.mk   | 27 +++++++++++++++++++++++++++
>  4 files changed, 53 insertions(+)
>  create mode 100644 package/libgtkmm30/Config.in
>  create mode 100644 package/libgtkmm30/libgtkmm30.hash
>  create mode 100644 package/libgtkmm30/libgtkmm30.mk

Applied, after some changes:

    [Thomas:
     - rename from libgtkmm30 to gtkmm3.
     - add libsigc dependency.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
