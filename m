From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:30:50 +0200
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: drop
 erroneous "break" in CVE.affects()
In-Reply-To: <20200827155717.827AD81845@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 27 Aug 2020 18:04:33 +0200")
References: <20200827155717.827AD81845@busybox.osuosl.org>
Message-ID: <87o8muoeyd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=b3f959fe968cca773cecf1c354b22f8b69201afc
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit 7d2779ecbb142b62f8913d30352b11058f922b2a
 > ("support/script/pkg-stats: handle exception when version comparison
 > fails") erroneousy introduced a "break" within a try/expect block.

 > This break has the unfortunate consequence that every CVE that was
 > using the <= operator was skipped, and according to the current
 > CVE statistics, made us miss 74 CVEs out of 141 CVEs.

:/

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
