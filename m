From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Sep 2012 22:01:33 +0200
Subject: [Buildroot] [PATCH 1/2] dnsmasq: bump to version 2.63
In-Reply-To: <20120904180016.GC3768@tarshish> (Baruch Siach's message of "Tue, 
 4 Sep 2012 21:00:16 +0300")
References: <1346767658-7968-1-git-send-email-gustavo@zacarias.com.ar>
 <20120904180016.GC3768@tarshish>
Message-ID: <87ligp5zhe.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 >> +DNSMASQ_LICENSE = GPLv2 GPLv3

 Baruch> Looks confusing. Is it "either v2 or v3"? If so, then I think

 Baruch> DNSMASQ_LICENSE = Dual GPLv2/GPLv3

Or even GPLv2+

-- 
Bye, Peter Korsgaard
