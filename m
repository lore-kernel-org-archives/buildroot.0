From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Aug 2017 23:01:16 +0200
Subject: [Buildroot] Failing defconfigs due to GCC 6
Message-ID: <15ef0875-b514-cb30-02df-d5d413bb0ea9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi all,

 A number of defconfigs fail to build (usually the kernel, in one case U-Boot)
because of GCC 6. Some of these could be fixed by simply bumping the upstream
kernel; however, we really want defconfigs to be tested on an actual board,
otherwise there's not much point.

 I've put the people who have been involved in these defconfigs in To. Could you
look at these defconfigs and try to fix the build with GCC 6? Anything that
remains unfixed by the end of the month will probably be removed.

beaglebone_qt5_defconfig:
https://gitlab.com/buildroot.org/buildroot/-/jobs/27873600

firefly_rk3288_defconfig:
https://gitlab.com/buildroot.org/buildroot/-/jobs/27873613

firefly_rk3288_demo_defconfig:
https://gitlab.com/buildroot.org/buildroot/-/jobs/27873615

ci40_defconfig:
https://gitlab.com/buildroot.org/buildroot/-/jobs/27873604

armadeus_apf9328_defconfig:
https://gitlab.com/buildroot.org/buildroot/-/jobs/27873568

galileo_defconfig:
https://gitlab.com/buildroot.org/buildroot/-/jobs/27873632

freescale_p1010rdb_pa_defconfig:
https://gitlab.com/buildroot.org/buildroot/-/jobs/27873630


 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
