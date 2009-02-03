From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Feb 2009 09:55:18 +0100
Subject: [Buildroot] XBurst CPU by Ingenic
In-Reply-To: <84687A6B-E461-4916-A313-3E441B940217@laptouchinc.com> (Daniel
	Jabbour's message of "Mon\, 2 Feb 2009 15\:31\:03 -0500")
References: <84687A6B-E461-4916-A313-3E441B940217@laptouchinc.com>
Message-ID: <87hc3bgart.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Jabbour <daniel@laptouchinc.com> writes:

 Daniel> Hi,
 Daniel> Has anyone used buildroot with the XBurst CPU by Ingenic? It's a MIPS  
 Daniel> 32 compatible CPU which Ingenic has released a toolkit for on their  
 Daniel> site (http://www.ingenic.cn/eng/productServ/kfyd/Linux/ 
 Daniel> pfCustomPage.aspx). It seems pretty straight forward, but I'm  
 Daniel> wondering if I need to use their toolchain or if I can simply use  
 Daniel> buildroot and select MIPS as the architecture.

 Daniel> My question is basically: Would you recommend using the Ingenic  
 Daniel> toolchain or simply a generic MIPS-32 one?

No idea, but the simplest approach would probably to just do a quick
BR compilation with the generic mips32 compiler and check that it all
works.

-- 
Bye, Peter Korsgaard
