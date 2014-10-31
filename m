From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 31 Oct 2014 18:45:31 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-10-30
References: <20141031073016.162E2100B71@stock.ovh.net>
 <5453C5A3.4080506@imgtec.com>
Message-ID: <XnsA3D7BED321C6BberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente Olivert Riera <Vincent.Riera@imgtec.com> 
wrote in news:5453C5A3.4080506 at imgtec.com:

> Dear all,
> 
> On 10/31/2014 07:30 AM, Thomas Petazzoni wrote:
>> Build statistics for 2014-10-30
> 
>>     mips64el | tvheadend-596b4e0b29937a612... | NOK | 
http://autobuild.buildroot.net/results/3aaa28eb4fd04a5b578c5128b57ce89165e473
be/
>>     mips64el | tvheadend-596b4e0b29937a612... | NOK | 
http://autobuild.buildroot.net/results/467df0fde737de0ec89fe023b2ce33546543d3
35/
> 
> tvheadend fails to build with Python3.
> 
> Reported upstream: https://tvheadend.org/issues/2444
> 
> Should we make this packages depend on !BR2_PACKAGE_PYTHON3 until
> upstream fixes the problem?

Hi,

it is not necessary to add this dependency, since tvheadend complains only 
about the python host package, this morning I sent a patch to fix the 
problem: http://patchwork.ozlabs.org/patch/405199/

Regards, Bernd
