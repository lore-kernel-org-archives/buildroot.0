From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 07 Mar 2015 16:45:59 +0100
Subject: [Buildroot] Buildroot developer meeting summary
Message-ID: <54FB1D37.8030700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi all,

 The buildroot developer meeting is already more than a month ago, and I've
finally gotten around to writing a summary of the outcome. You can find it on [1].

 The report of the meeting is written at [2]. This section summarizes the main
points and conclusions.


Patches

The main result of this developer meeting has been a big patchwork cleanup. We
managed to reduce the number of pending patches in patchwork from about 350 to
about 200. A good deal of patches have been rejected (with an explanation why),
but also many patches have been applied after some clean-up.

Some of the patch series required some discussion to decide how to continue with
them. Normally the conclusions should have been posted on the list, but you can
also out the full report.


GSoC and money

Thanks to GSoC, buildroot now has some money. There is now an accounting section
on this wiki to keep track of where it comes from and how it is spent. Since
founding a non-profit seems to be too much effort, the money is currently held
by Yann E. Morin.

Some ideas were posted for the next GSoC. As it turns out, however, we've not
been accepted as a mentoring organisation for GSoC'15. Better luck next year!


Help text and README

Due to a patch series to rewrite the 'make help' output by ThomasP., we have
discussed what we really want to show where. The conclusions are:

* Keep one big 'make help', no 'make foo-help'. Order the output in a more
logical way.

* Create a new 'make list-defconfigs' to reduce the output of 'make help'. Add a
FAQ entry that refers to this.

* The README should be rewritten so it is small and refers to other documentation.

Arnout was volunteered to do this.



 Regards,
 Arnout

[1] http://elinux.org/Buildroot:DeveloperDaysFOSDEM2015#Summary_and_conclusions
[2] https://lite5.framapad.org/p/buildrootfosdem15
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
