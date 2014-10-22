From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Oct 2014 14:55:58 +0200
Subject: [Buildroot] Buildroot developer meeting report
Message-ID: <5447A95E.2090008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi all,

 Just before ELC-E in Duesseldorf, on October 11 and 12, we had a Buildroot
Developer Meeting (sponsored by Mind, yay!). You can find the report on the wiki:

http://elinux.org/Buildroot:DeveloperDaysELCE2014#Discussion_topics_and_report


 Some highlights:

* We mainly used this time to clean up patchwork. We didn't keep exact
statistics, but the number of patches was reduced from roughly 350 to roughly
250, and a significant number of patches have been reviewed and/or reposted.

* There were a few important large series that were discussed and eventually
applied.

* We have taken a decision on how to deal with atomic operations, with missing
license files, with march/mcpu/mtune conflicts, and we have decided to leave the
package name out of patch file names. Some of these things have been
implemented, some are still to do.

* We discussed the GSoC project which wasn't successful this year. We'll try
again next year.


 If there is any further point of discussion or a conclusion that you don't
agree with, feel free to start a discussion here on the list or on IRC.


 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
