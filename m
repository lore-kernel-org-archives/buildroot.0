From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 Sep 2013 09:22:52 +0200
Subject: [Buildroot] Is GPLv2 the right license for Buildroot?
In-Reply-To: <523906E4.8080404@rftechnology.com.au> (Jason Rennie's message of
 "Wed, 18 Sep 2013 11:50:28 +1000")
References: <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
 <20130912202157.536e5904@skate>
 <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
 <20130912203359.7e650ebe@skate> <52323A54.7020808@mind.be>
 <20130912221256.GE3362@free.fr> <523388B6.7090305@mind.be>
 <20130914221613.GA3444@free.fr> <20130916182101.3844a686@skate>
 <20130916170815.GB3293@free.fr>
 <F9C551623D2CBB4C9488801D14F864C639ACE1F5@ex-mb1.corp.adtran.com>
 <20130916200135.1724084e@skate> <523906E4.8080404@rftechnology.com.au>
Message-ID: <87k3ied25v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jason" == Jason Rennie <jason.rennie@rftechnology.com.au> writes:

 Jason> I may be missing something here and feel free to call me names if I
 Jason> am, also IANAL.

 Jason> That being said, wouldn't building a system with buildroot be
 Jason> essentially the same case to using GCC to compile a program? The final
 Jason> libraries you link with (or packages you include in the case of
 Jason> buildroot) may be encumbered with all manner of licenses but the
 Jason> license of the buildtool doesn't make any difference to the license
 Jason> status of the final product.

 Jason> If you were making changes to buildroot and redistributing those then
 Jason> the license would apply but not otherwise.

Well, yes and no - It depends on the interpretation the 'scripts used to
control compilation' part of section 3:

The source code for a work means the preferred form of the work for
making modifications to it. For an executable work, complete source code
means all the source code for all modules it contains, plus any
associated interface definition files, plus the scripts used to control
compilation and installation of the executable

Again, IANAL.

-- 
Bye, Peter Korsgaard
