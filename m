From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 Jun 2014 23:57:15 +0200
Subject: [Buildroot] [PATCH 1/3] dbus: don't forcibly disable static
	builds
In-Reply-To: <1403097697-15782-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 18 Jun 2014 10:21:35 -0300")
References: <1403097697-15782-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87tx7h285g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > It's there for some historical reason and breaks libpcap with dbus
 > support for static linkage scenarios (like the one used by tcpreplay).

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed all 3, thanks.

-- 
Bye, Peter Korsgaard
