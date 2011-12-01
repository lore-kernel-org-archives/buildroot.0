From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 01 Dec 2011 20:17:40 +0100
Subject: [Buildroot] [PATCH 1/2] dbus: bump to version 1.5.8
In-Reply-To: <1322758957-8248-1-git-send-email-zonque@gmail.com> (Daniel
 Mack's message of "Thu, 1 Dec 2011 18:02:36 +0100")
References: <1322758957-8248-1-git-send-email-zonque@gmail.com>
Message-ID: <87borsgkyz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:

 Daniel> Signed-off-by: Daniel Mack <zonque@gmail.com>
 Daniel> ---
 Daniel>  package/dbus/dbus.mk |    2 +-
 Daniel>  1 files changed, 1 insertions(+), 1 deletions(-)

 Daniel> diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
 Daniel> index e18e291..3bff242 100644
 Daniel> --- a/package/dbus/dbus.mk
 Daniel> +++ b/package/dbus/dbus.mk
 Daniel> @@ -3,7 +3,7 @@
 Daniel>  # dbus
 Daniel>  #
 Daniel>  #############################################################
 Daniel> -DBUS_VERSION = 1.4.16
 Daniel> +DBUS_VERSION = 1.5.8

Isn't 1.5.x the unstable development series? Why would we want that in
Buildroot?

-- 
Bye, Peter Korsgaard
