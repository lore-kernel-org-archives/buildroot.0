From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 21:29:03 +0100
Subject: [Buildroot] [PATCH 3/7] sysrepo: libnetconf2 is not needed
In-Reply-To: <9ce249faace5681092cd55ca8a1a046479c66bc5.1575456104.git.jan.kundrat@cesnet.cz>
 ("Jan =?utf-8?Q?Kundr=C3=A1t=22's?= message of "Wed, 4 Dec 2019 10:35:27
 +0100")
References: <cover.1575456104.git.jan.kundrat@cesnet.cz>
 <9ce249faace5681092cd55ca8a1a046479c66bc5.1575456104.git.jan.kundrat@cesnet.cz>
Message-ID: <87h81syui8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jan" == Jan Kundr?t <jan.kundrat@cesnet.cz> writes:

 > The libnetconf2 library is a dependency of Netopeer2. Sysrepo does not
 > have a NETCONF server or a NETCONF client, so it does not use this
 > library.

 > Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
