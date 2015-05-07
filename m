From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 May 2015 09:42:02 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150507093312.5e6840ef@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 7 May 2015 09:33:12 +0200")
References: <20150506063017.6B6A61015C1@stock.ovh.net>
 <20150506094236.114894a2@free-electrons.com>
 <20150507040526.GS8309@waldemar-brodkorb.de>
 <20150507093312.5e6840ef@free-electrons.com>
Message-ID: <87mw1gn8ad.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

>> It is not fixed in uClibc master.

 > Ok, thanks for the confirmation.

 > So here is my proposal:

 >  1/ For the 2015.05 release, we simply add exceptions to the
 >     autobuilder script to avoid such problematic cases.

 >  2/ For the 2015.08 release, we switch to uClibc-ng as the default
 >     uClibc version, and I rebuild all uClibc based external toolchains
 >     to use uClibc-ng.

 > What do others think?

Sounds good to me.

-- 
Bye, Peter Korsgaard
