From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Mar 2018 22:56:59 +0100
Subject: [Buildroot] socrates_cyclone5_defconfig fails to build
Message-ID: <20180304225659.732860df@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Micha?,

The socrates_cyclone5_defconfig that you contributed to Buildroot
doesn't build anymore, with the following error:

Could not fetch special ref 'rel_socfpga-4.1.33-ltsi_17.07.02_pr';
assuming it is not special. error: pathspec
'rel_socfpga-4.1.33-ltsi_17.07.02_pr' did not match any file(s) known
to git.

See:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306947

Could you have a look into this ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
