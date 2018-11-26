From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 17:21:48 +0100
Subject: [Buildroot] [PATCH 1/1] netplug (/etc/init.d/S29netplug): Fix
 the quoting of ${NETWORKING}.
In-Reply-To: <20181115134818.11190-1-thomas.claveirole@green-communications.fr>
 (Thomas Claveirole's message of "Thu, 15 Nov 2018 14:48:17 +0100")
References: <20181115134818.11190-1-thomas.claveirole@green-communications.fr>
Message-ID: <87sgznx10j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Claveirole <thomas.claveirole@green-communications.fr> writes:

 > Since 4adaa581b27dc27298eb7cc421ee8f530f88e18e, S29netplug looks for
 > /etc/default/network instead of /etc/sysconfig/network.  When this
 > file exists but does not define $NETWORKING, the script fails on line
 > 29 with something like:

 > /etc/init.d/S29netplug: 29: [: =: unexpected operator

 > Fix quoting so this error no longer happens.

 > Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
