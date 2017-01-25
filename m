From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 16:46:58 +1300
Subject: [Buildroot] [PATCH 1/1] package: remove the default value of
 the $(PKG)_SOURCE variable
In-Reply-To: <1483434942-22000-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1483434942-22000-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20170125164658.573b1511@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  3 Jan 2017 10:15:42 +0100, Jerzy Grzegorek wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> ---
>  package/alljoyn-base/alljoyn-base.mk                   | 1 -
>  package/batman-adv/batman-adv.mk                       | 1 -
>  package/circus/circus.mk                               | 1 -
>  package/crudini/crudini.mk                             | 1 -
>  package/eudev/eudev.mk                                 | 1 -
>  package/evtest/evtest.mk                               | 1 -
>  package/ibrcommon/ibrcommon.mk                         | 1 -
>  package/ibrdtn/ibrdtn.mk                               | 1 -
>  package/ibrdtnd/ibrdtnd.mk                             | 1 -
>  package/log4cpp/log4cpp.mk                             | 1 -
>  package/mariadb/mariadb.mk                             | 1 -
>  package/ola/ola.mk                                     | 1 -
>  package/proftpd/proftpd.mk                             | 1 -
>  package/putty/putty.mk                                 | 1 -
>  package/python-dateutil/python-dateutil.mk             | 1 -
>  package/python-engineio/python-engineio.mk             | 1 -
>  package/python-networkmanager/python-networkmanager.mk | 1 -
>  package/python-socketio/python-socketio.mk             | 1 -
>  package/syslog-ng/syslog-ng.mk                         | 1 -
>  package/tpm-tools/tpm-tools.mk                         | 1 -
>  package/trousers/trousers.mk                           | 1 -
>  package/tunctl/tunctl.mk                               | 1 -
>  22 files changed, 22 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
