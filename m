From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Feb 2016 13:42:33 +0100
Subject: [Buildroot] [PATCH] iptables: fix libpcap static linking
In-Reply-To: <1452086738-4541-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 6 Jan 2016 10:25:38 -0300")
References: <1452086738-4541-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <871t8v707a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > libpcap can depend on other libraries like libusb and doesn't support
 > pkgconfig, so add those libraries to LIBS when building statically.
 > Fixes:
 > http://autobuild.buildroot.net/results/b4a/b4a3d00e9673a7aacc663c81de1d8e887a17951d/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
