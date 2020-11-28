From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Nov 2020 09:21:55 +0100
Subject: [Buildroot] [PATCH] package/slirp: add upstream security fix
 for CVE-2020-29129 / CVE-2020-29130
In-Reply-To: <20201127172516.7797-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 27 Nov 2020 18:25:15 +0100")
References: <20201127172516.7797-1-peter@korsgaard.com>
Message-ID: <87lfelrivw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > While processing ARP/NCSI packets in 'arp_input' or 'ncsi_input'
 > routines, ensure that pkt_len is large enough to accommodate the
 > respective protocol headers, lest it should do an OOB access.
 > Add check to avoid it.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
