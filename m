From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Mar 2017 00:35:54 +0100
Subject: [Buildroot] [PATCH] tcpreplay: patch security issue
In-Reply-To: <ca98f5adf97d81a7ae436c03567ac62f733698fe.1489689683.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 16 Mar 2017 20:41:23 +0200")
References: <ca98f5adf97d81a7ae436c03567ac62f733698fe.1489689683.git.baruch@tkos.co.il>
Message-ID: <87y3w3mq79.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add upstream patch for CVE-2017-6429: Buffer overflow when reading crafted
 > pcap file with large packets.

 > https://github.com/appneta/tcpreplay/issues/278

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
