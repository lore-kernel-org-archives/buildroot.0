From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Sep 2013 23:13:48 +0200
Subject: [Buildroot] Is GPLv2 the right license for Buildroot?
In-Reply-To: <20130916170815.GB3293@free.fr> (Yann E. MORIN's message of "Mon, 
 16 Sep 2013 19:08:15 +0200")
References: <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
 <20130912202157.536e5904@skate>
 <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
 <20130912203359.7e650ebe@skate> <52323A54.7020808@mind.be>
 <20130912221256.GE3362@free.fr> <523388B6.7090305@mind.be>
 <20130914221613.GA3444@free.fr> <20130916182101.3844a686@skate>
 <20130916170815.GB3293@free.fr>
Message-ID: <87r4cofp0z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 Yann> Now, let's try to make things clear:

 Yann>   - on an embedded system, the probability that there is a GPL program
 Yann>     is rather high (eg. busybox, the Linux kernel);

 Yann>   - lets assume Buildroot is used to build those programs;

 Yann>   - the GPL (as applied to _those_ programs, not Buildroot) mandates
 Yann>     that the script to control compilation and installation of those
 Yann>     programs be made available (section of GPLv2);

 Yann>   - so the easiest way to comply with those programs' GPL is to
 Yann>     distribute the Buildroot tree that was used to build the target
 Yann>     filesystem, since it does contain all required recipes (aka the
 Yann>     scripts of section 3 of the GPLv2)

 Yann>   - Buildroot is itself GPLv2, so by distributing the Buildroot tree, a
 Yann>     company has to release it under GPLv2.

Indeed.

-- 
Bye, Peter Korsgaard
