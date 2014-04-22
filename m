From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 22 Apr 2014 18:41:34 +0200
Subject: [Buildroot] Analysis of build results for 2014-04-19
In-Reply-To: <20140420104812.5bc926a9@skate>
References: <20140420063009.8B76B100DB9@stock.ovh.net>
 <20140420104812.5bc926a9@skate>
Message-ID: <53569BBE.1020707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/04/14 10:48, Thomas Petazzoni wrote:
> On Sun, 20 Apr 2014 08:30:09 +0200 (CEST), Thomas Petazzoni wrote:
> 
>> >     x86_64 |   CXX      DerivedSources/W... | TIM | http://autobuild.buildroot.net/results/a3a8607751156fb47dc5c145fcd46825a93078dc/
> Once again, timeout while building webkit.
> 

 I think there should be two changes to the autobuilders.

- Reduce the % yes. With the growing number of packages, the number of
selected packages is also becoming unrealistically large.

- If webkit is selected, increase the timeout with an hour. I don't know
how easy that is, though.

 It would of course be even better if the autobuilder would calculate the
timeout based on historical information from build-time.log, but I guess
that's a bit too ambitious :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
