From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Nov 2017 21:10:45 +0100
Subject: [Buildroot] [PATCH 2/2] uboot-tools: use local libfdt.h
In-Reply-To: <20171106121328.20330-2-matthew.weber@rockwellcollins.com> (Matt
 Weber's message of "Mon, 6 Nov 2017 06:13:28 -0600")
References: <20171106121328.20330-1-matthew.weber@rockwellcollins.com>
 <20171106121328.20330-2-matthew.weber@rockwellcollins.com>
Message-ID: <87po8vw4l6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > The use of libfdt.h by u-boot is using the
 > <system-path>.  The libfdt part of uboot
 > is expriencing a lot of change and this patch
 > should be overcome by events post uboot-2017.11
 > release.

 > Jan submitted the following upstream
 > https://patchwork.ozlabs.org/patch/833760/

 > Resolves:
 > http://autobuild.buildroot.net/results/347cde4b5c0e6ca76d354396385be4ec1294da73
 > http://autobuild.buildroot.net/results/2b429f82bed1f03d69021e0f959da4e2db2b5a0b
 > http://autobuild.buildroot.net/results/b18012963926682ba192b9176bd3e35fb07cdf56

 > CC: Jan Kundr?t <jan.kundrat@cesnet.cz>
 > CC: Arnout Vandecappelle <arnout@mind.be>
 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
