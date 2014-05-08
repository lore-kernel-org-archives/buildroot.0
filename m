From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Thu, 08 May 2014 20:49:11 +0200
Subject: [Buildroot] musl support added in Buildroot
References: <20140506142414.26a431d2@skate>
Message-ID: <760t3bxpcs.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20140506142414.26a431d2 at skate:

>  * Building cross-toolchains with the musl C library

Hi,

small note: libxml2 fails to compile using musl:

threads.c:80:27: error: macro "pthread_equal" requires 2 arguments, but only 
1 given
threads.c:80:12: error: 'pthread_equal' redeclared as different kind of 
symbol

Regards, Bernd
