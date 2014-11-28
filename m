From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Nov 2014 12:19:24 +0100
Subject: [Buildroot] [PATCH] tcpdump: add 3 security patches
In-Reply-To: <1417170345-10871-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 28 Nov 2014 07:25:45 -0300")
References: <1417170345-10871-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87zjbblghv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2014-8767 - denial of service in verbose mode using malformed OLSR
 > payload
 > OLSR payload
 > CVE-2014-8768 - denial of service in verbose mode using malformed Geonet
 > payload
 > CVE-2014-8769 - unreliable output using malformed AOVD payload

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
