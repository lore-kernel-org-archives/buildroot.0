From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 21:22:26 +0100
Subject: [Buildroot] [PATCH v2] package/avahi: add upstream security fix
In-Reply-To: <20190312234651.13693-1-panfilov.artyom@gmail.com> (Artem
 Panfilov's message of "Wed, 13 Mar 2019 02:46:51 +0300")
References: <20190312234651.13693-1-panfilov.artyom@gmail.com>
Message-ID: <87va06k8l9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Artem" == Artem Panfilov <panfilov.artyom@gmail.com> writes:

 > Fixes CVE-2017-6519: avahi-daemon in Avahi through 0.6.32 and 0.7
 > inadvertently responds to IPv6 unicast queries with source addresses
 > that are not on-link, which allows remote attackers to cause a denial
 > of service (traffic amplification) and may cause information leakage
 > by obtaining potentially sensitive information from the responding
 > device via port-5353 UDP packets.

 > Signed-off-by: Artem Panfilov <panfilov.artyom@gmail.com>

 > ---
 > Changes v1 -> v2:
 >   - add "Signed-off-by" and "Backported from" tags in patch

Committed to 2018.02.x, 2018.11.x and 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
