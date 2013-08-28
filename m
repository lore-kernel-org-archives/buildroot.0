From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Aug 2013 23:09:50 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20130828090812.43a7f849@skate>
References: <20130828063005.74A7952C1BE@lolut.humanoidz.org>
 <20130828090812.43a7f849@skate>
Message-ID: <521E671E.7090501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/28/13 09:08, Thomas Petazzoni wrote:
>>      x86_64 |                       gpsd-3.9 | NOK |http://autobuild.buildroot.net/results/d58be37b9b18b37eab4acec9a6bbe28863ef4d22/
> scons: *** [gpsd] Implicit dependency `/home/test/test/2/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libm.so' not found, needed by target `gpsd'.
>
> Not sure what's happening here. Surely if -lm was missing, we would be
> seeing more build failures of gpsd, no?

  This one should be fixed by 5628776c4a4d29d0715633ea463b64cc19e19c5a.


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
