From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 20:27:33 +0200
Subject: [Buildroot] [PATCH 1/1] python-dbus: new package
In-Reply-To: <1405086960-14881-2-git-send-email-david.bachelart@bbright.com>
References: <1405086960-14881-1-git-send-email-david.bachelart@bbright.com>
 <1405086960-14881-2-git-send-email-david.bachelart@bbright.com>
Message-ID: <20140715202733.25231638@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear David Bachelart,

On Fri, 11 Jul 2014 15:56:00 +0200, David Bachelart wrote:
> python-dbus is a binding for libdbus, the reference implementation of
> D-Bus
> 
> Signed-off-by: David Bachelart <david.bachelart@bbright.com>
> ---
>  package/Config.in                  |    1 +
>  package/python-dbus/Config.in      |   17 +++++++++++++++++
>  package/python-dbus/python-dbus.mk |   16 ++++++++++++++++
>  3 files changed, 34 insertions(+)
>  create mode 100644 package/python-dbus/Config.in
>  create mode 100644 package/python-dbus/python-dbus.mk

Thanks for the patch! However, as Gustavo Zacarias reported, we already
have this package, under the name dbus-python. So I've marked your
patch as Rejected in our patch tracking system. Do not hesitate to let
us know if the existing dbus-python package doesn't work for you, for
some reason.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
