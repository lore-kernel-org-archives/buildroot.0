From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 08 Oct 2010 09:23:41 +0200
Subject: [Buildroot] [PATCH] New package: rrdtool
In-Reply-To: <4CA4A545.9050302@zacarias.com.ar> (Gustavo Zacarias's message of
	"Thu, 30 Sep 2010 11:57:09 -0300")
References: <4CA4A545.9050302@zacarias.com.ar>
Message-ID: <87ocb5p2pu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Add new rrdtool package to make nitfy graphs.
 Gustavo> Using the 1.2 branch as a good compromise of size versus features.
 Gustavo> Enjoy.

Thanks, committed with a small tweak (use install hook to remove
examples).

-- 
Bye, Peter Korsgaard
