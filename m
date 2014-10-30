From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 22:25:57 +0100
Subject: [Buildroot] [PATCH v6 2/3] package/dovecot-pigeonhole: New
 package
In-Reply-To: <1414613646-24490-2-git-send-email-bernd.kuhls@t-online.de>
References: <1414613646-24490-1-git-send-email-bernd.kuhls@t-online.de>
 <1414613646-24490-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141030222557.5a9ef950@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 29 Oct 2014 21:14:05 +0100, Bernd Kuhls wrote:
> ---
> v6: bump version to 0.4.4
> v5: no changes
> v4: no changes
> v3: DOVECOT_PIGEONHOLE_CONF_OPT -> DOVECOT_PIGEONHOLE_CONF_OPTS
> v2: - package moved to new Dovecot dependency submenu
>     - removed cruft from CONV_OPT not needed for buildroot (Thomas)
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/dovecot-pigeonhole/Config.in             |    8 ++++++++
>  package/dovecot-pigeonhole/dovecot-pigeonhole.mk |   16 ++++++++++++++++
>  package/dovecot/Config.in                        |    2 ++
>  3 files changed, 26 insertions(+)
>  create mode 100644 package/dovecot-pigeonhole/Config.in
>  create mode 100644 package/dovecot-pigeonhole/dovecot-pigeonhole.mk

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
