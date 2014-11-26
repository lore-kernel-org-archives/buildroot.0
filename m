From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Nov 2014 16:11:55 +0100
Subject: [Buildroot] [PATCH v3] package/network-manager: NM needs
	isc-dhcpc or dhcpcd
In-Reply-To: <1416999055-11095-1-git-send-email-nroach44@gmail.com> (Nathaniel
 Roach's message of "Wed, 26 Nov 2014 18:50:55 +0800")
References: <1416999055-11095-1-git-send-email-nroach44@gmail.com>
Message-ID: <8761e2q9ms.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nathaniel" == Nathaniel Roach <nroach44@gmail.com> writes:

 > NM only currently supports isc-dhcpc, dhcpcd and dhclient
 > as clients because NM communicates with the client
 > through DBus, and support for clients needs to be
 > written in. (as per files in src/dhcp-manager)

 > Buildroot's default, udhcpc is not supported, and
 > dhclient is not in buildroot.

 > Add the dependencies to Config.in, favoring dhcpcd as
 > default due to size.

Committed with the description tweaked to not refer to dhclient as
suggested by Gustavoz, thanks.

-- 
Bye, Peter Korsgaard
