From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 06 Aug 2014 22:16:32 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-07-30
References: <20140731063010.27D091019B7@stock.ovh.net>
 <XnsA37BCBAC6964BberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20140731234958.60905813@free-electrons.com>
Message-ID: <XnsA381E2996F96BberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20140731234958.60905813 at free-electrons.com:

> Dear Bernd Kuhls,
> 
> On Thu, 31 Jul 2014 20:01:21 +0200, Bernd Kuhls wrote:
>> Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
>> @public.gmane.org> wrote in news:20140731063010.27D091019B7-
kgRh+nxlcD+LZ21kGMrzwg at public.gmane.org:
>> 
>> >        arm |             xbmc-13.2b2-Gotham | NOK | 
>> 
http://autobuild.buildroot.net/results/639cda872cf36c122cbd6139dd76f6b51ac186
>> 4e/
>> 
>> Hi,
>> 
>> @Peter: Which java version do you have installed on your autobuilder?
> 
> thomas at gcc10:~$ java -version
> java version "1.5.0"
> gij (GNU libgcj) version 4.3.2
> 
Hi,

according to http://jira.codehaus.org/browse/GROOVY-3701 (the package used by 
xbmc) does not work with gcj, it should use another java version instead, 
like openjdk: http://forum.xbmc.org/showthread.php?tid=199742

I would like to suggest to extend the check for BR2_NEEDS_HOST_JAVA to reject 
gcj, I will send a patch.

Regards, Bernd
