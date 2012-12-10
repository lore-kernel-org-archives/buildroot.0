From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Dec 2012 10:30:16 +0100
Subject: [Buildroot] [PATCH 2/2] dnsmasq: bump to version 2.64
In-Reply-To: <1354840348-24951-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 6 Dec 2012 21:32:28 -0300")
References: <1354840348-24951-1-git-send-email-gustavo@zacarias.com.ar>
 <1354840348-24951-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ip8atftj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

It unfortunately fails here:

http://autobuild.buildroot.net/results/26a9e152f533e467f68b72a373d0fc84d561eb87/build-end.log

From a quick look, it seem parse_server() should be moved outside the
HAVE_DHCP conditional.

-- 
Bye, Peter Korsgaard
