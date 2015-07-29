From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 29 Jul 2015 21:55:02 +0200
Subject: [Buildroot] Analysis of build failures
References: <20150729063017.EDA6D101EBC@stock.ovh.net>
 <20150729100334.00137b70@free-electrons.com>
Message-ID: <mlnn8cxv4u.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Wed, 29 Jul 2015 10:03:34 +0200 schrieb Thomas Petazzoni:

>>          arm |                  mesa3d-10.6.2 | NOK |
>>          http://autobuild.buildroot.net/
results/6e313e2a4b2ff092d187ac564f25c14aaaceb0dd/
> 
> checking for LIBUDEV... no configure: error: Cannot use static libraries
> for DRI drivers make: ***
> [/home/test/autobuild/instance-1/output/build/
mesa3d-10.6.2/.stamp_configured]
> Error 1 make: Leaving directory
> `/home/test/autobuild/instance-1/buildroot'
> 
> Bernd, can you have a look?

Fixed by http://patchwork.ozlabs.org/patch/501804/

Regards, Bernd
