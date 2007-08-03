From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Fri, 3 Aug 2007 21:20:50 +0200 (CEST)
Subject: [Buildroot] [bug] undefined symbol BR2_PACKAGE_LIBDAEMON
Message-ID: <0708032117420.13739@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

package/avahi/Config.in:3:warning: 'select' used by config symbol
'BR2_PACKAGE_AVAHI' refer to undefined symbol 'BR2_PACKAGE_LIBDAEMON'


Cheers,

-- 
Cristian
