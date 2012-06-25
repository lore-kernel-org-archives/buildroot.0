From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 25 Jun 2012 08:27:48 +0200
Subject: [Buildroot] [PATCH 1/2] libpcap: bump to version 1.3.0
In-Reply-To: <b62717db24356f9761c48c7439ab757f0d32f3b7.1340596768.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 25 Jun 2012 07:00:28 +0300")
References: <b62717db24356f9761c48c7439ab757f0d32f3b7.1340596768.git.baruch@tkos.co.il>
Message-ID: <87obo79a8r.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 Baruch> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 Baruch> ---
 Baruch>  package/libpcap/libpcap.mk |    2 +-
 Baruch>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, but:

Applying libpcap-dont-fail-on-missing-netfilter.patch using patch: 
patching file pcap-netfilter-linux.c
Reversed (or previously applied) patch detected!  Assume -R? [n] 

Have you tested this against git head?

-- 
Bye, Peter Korsgaard
