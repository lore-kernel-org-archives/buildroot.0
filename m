From: Doug Kehn <rdkehn@yahoo.com>
Date: Fri, 24 Oct 2014 19:32:25 +0000 (UTC)
Subject: [Buildroot] Buildroot developer meeting report
In-Reply-To: <5447A95E.2090008@mind.be>
References: <5447A95E.2090008@mind.be>
Message-ID: <483025893.317038.1414179145585.JavaMail.yahoo@jws10056.mail.ne1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, Everyone,
I'm new to Buildroot and have been evaluating it along with Yocto to replace uClinux/home-brew environment for a new design. ?I noticed in the 'Discussion_topics_and_report' that there was an evaluation of BR2_EXTERNAL. ?Was it determined what was needed? ?I hope this wasn't a foreshadowing that BR2_EXTERNAL might be deprecated.
As part of my evaluation, I created a 'doug' directory and mimicked the Buildroot?directory structure as needed. ?All my custom bits were confined to this directory; I didn't pollute the Buildroot tree with irrelevant changes. ?I then use BR2_EXTERNAL to point to 'doug'. ?For example,
make BR2_EXTERNAL=doug [defconfig]
set up the environment to point to all the proper locations. ?BR2_EXTERNAL, as is, is a very nice feature!
Thanks and regards,...doug(Doug Kehn) 

     On Wednesday, October 22, 2014 7:56 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
   

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
Arnout Vandecappelle? ? ? ? ? ? ? ? ? ? ? ? ? arnout at mind be
Senior Embedded Software Architect? ? ? ? ? ? +32-16-286500
Essensium/Mind? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium? ? ? ? ? BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:? 7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot


   
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141024/a731637d/attachment.html>
