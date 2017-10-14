From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Oct 2017 22:42:52 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-10-13
In-Reply-To: <20171014185420.2cyymqxd26mq6cms@tarshish> (Baruch Siach's
 message of "Sat, 14 Oct 2017 21:54:20 +0300")
References: <20171014063057.C392B207DB@mail.free-electrons.com>
 <20171014185420.2cyymqxd26mq6cms@tarshish>
Message-ID: <87infhxxyr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,

 >>>> dbus 1.10.24 Downloading
 > --2017-10-13 18:36:11--  https://dbus.freedesktop.org/releases/dbus/dbus-1.10.24.tar.gz
 > Resolving dbus.freedesktop.org (dbus.freedesktop.org)... 131.252.210.176, 2610:10:20:722:a800:ff:feda:470f
 > Connecting to dbus.freedesktop.org (dbus.freedesktop.org)|131.252.210.176|:443... connected.
 > ERROR: The certificate of `dbus.freedesktop.org' is not trusted.
 > --2017-10-13 18:36:12--  http://sources.buildroot.net/dbus-1.10.24.tar.gz
 > Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109
 > Connecting to sources.buildroot.net (sources.buildroot.net)|176.9.16.109|:80... connected.
 > HTTP request sent, awaiting response... 404 Not Found
 > 2017-10-13 18:36:12 ERROR 404: Not Found.

 > What happened to sources.buildroot.net? dbus-1.10.24.tar.gz has been there at 
 > some point, isn't it?

The machine unfortunately ran out of disk space. I've made some more
space, but something had gotten corrupted in the local git repo, causing
the mirroring to fail.

I've recloned the buildroot repo and restarted mirroring now.

-- 
Bye, Peter Korsgaard
