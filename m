From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 May 2010 23:55:13 +0200
Subject: [Buildroot] libcurl patch for package/libcurl.mk
In-Reply-To: <AANLkTinKnAh2KZLDa8ONvKjpYJbMVUv_6Ivco5R0Fx-o@mail.gmail.com>
	(Lionel Landwerlin's message of "Fri, 14 May 2010 15:19:22 +0200")
References: <4BED4404.8070706@unix-beratung.de>
	<AANLkTilRnpX5yxaRZmVTRa4SCiPrsYiFIGftOahiSJGf@mail.gmail.com>
	<4BED4C0B.7090803@unix-beratung.de>
	<AANLkTinKnAh2KZLDa8ONvKjpYJbMVUv_6Ivco5R0Fx-o@mail.gmail.com>
Message-ID: <87zkzmmipq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lionel" == Lionel Landwerlin <llandwerlin@gmail.com> writes:

 Lionel> What was your problem ? Does the compilation failed ? Any log of the failure ?
 Lionel> I think we should find why the configure script fails to define
 Lionel> HAVE_BOOL_T, and try to fix the autodetect problem.

Indeed. I had a look at it today, and was able to reproduce it with
iperf. I have committed a workaround for it in iperf.mk.

-- 
Bye, Peter Korsgaard
