From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Dec 2016 21:38:27 +0100
Subject: [Buildroot] [PATCH] angular-websocket: new package
In-Reply-To: <1481135684-62954-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1481135684-62954-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20161210213827.6d890306@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Dec 2016 12:34:44 -0600, Matt Weber wrote:
> From: Bimal Jacob <Bimal.Jacob@rockwellcollins.com>
> 
> Signed-off-by: Bimal Jacob <bimal.jacob@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/Config.in                              |  1 +
>  package/angular-websocket/Config.in            |  8 ++++++++
>  package/angular-websocket/angular-websocket.mk | 18 ++++++++++++++++++
>  3 files changed, 27 insertions(+)
>  create mode 100644 package/angular-websocket/Config.in
>  create mode 100644 package/angular-websocket/angular-websocket.mk

Applied to master, with the following changes:

    [Thomas:
     - Move to a submenu "External AngularJS plugins", much like we have an
       "External JQuery plugins" menu. Therefore, remove the "select
       BR2_PACKAGE_ANGULARJS" from the package, since
       angular-websocket/Config.in is now included only if
       BR2_PACKAGE_ANGULARJS is defined.
     - Add hash file.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
