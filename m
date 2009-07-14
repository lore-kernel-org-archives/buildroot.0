From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 14 Jul 2009 13:04:52 +0200
Subject: [Buildroot] [PATCH] optional DBus support in wpa_supplicant
In-Reply-To: <87k52c1lt5.fsf@macbook.be.48ers.dk>
References: <1247473258.4007.7.camel@sven> <1247476399.4007.13.camel@sven>
	<87ljms981c.fsf@macbook.be.48ers.dk> <1247495564.20117.4.camel@sven>
	<4A5B4D46.6010807@zacarias.com.ar> <87k52c1lt5.fsf@macbook.be.48ers.dk>
Message-ID: <1247569492.21613.7.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

attached is an updated patch that enables the DBus config interface in
wpa-supplicant if DBus is enabled in buildroot without introducing
another config option.


Sven


-------------- next part --------------
A non-text attachment was scrubbed...
Name: wpa-supplicant-dbus.diff
Type: text/x-patch
Size: 1782 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090714/affec8b1/attachment-0001.bin>
