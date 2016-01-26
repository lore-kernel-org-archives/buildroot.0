From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 26 Jan 2016 22:06:01 +0100
Subject: [Buildroot] Analysis of build failures
References: <20160122073021.E35B6101A27@stock.ovh.net>
 <20160122102957.10f29956@free-electrons.com>
Message-ID: <pm3lncxo36.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 22 Jan 2016 10:29:57 +0100 schrieb Thomas Petazzoni:

>>          arm |                      aumix-2.8 | NOK |
>>          http://autobuild.buildroot.net/results/
c8c7f9a799d1af507a6edd5e02b0bbc8b7b5d068/
> 
> gettext/libintl handling issue.

Hi Thomas,

fixed by http://patchwork.ozlabs.org/patch/573473/

Regards, Bernd
