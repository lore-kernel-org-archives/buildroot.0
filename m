From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Sep 2017 23:33:54 +0200
Subject: [Buildroot] [PATCH 2/3] package/samba4: add optional dependency
	to dbus
In-Reply-To: <20170723133620.13487-2-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 23 Jul 2017 15:36:19 +0200")
References: <20170723133620.13487-1-bernd.kuhls@t-online.de>
 <20170723133620.13487-2-bernd.kuhls@t-online.de>
Message-ID: <87d176m9ml.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > samba4 picks up dbus as dependency if it was built before:
 > Checking for dbus                : yes
 > Checking for header dbus/dbus.h  : yes
 > Checking for library dbus-1      : yes

 > There is no configure option to control dbus support so we just make
 > sure dbus is built before samba4 to have reproducible builds.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
