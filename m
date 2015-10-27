From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Oct 2015 22:16:09 +0100
Subject: [Buildroot] [PATCH 2/2] ipmiutil: fix stack protector test
In-Reply-To: <fe150b99186b8b76924cfaf246a3d56b43e1d8cb.1445950637.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 27 Oct 2015 14:57:17 +0200")
References: <88628938a5c1b5e5ec376f105519948386afe751.1445950637.git.baruch@tkos.co.il>
 <fe150b99186b8b76924cfaf246a3d56b43e1d8cb.1445950637.git.baruch@tkos.co.il>
Message-ID: <87mvv4812e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add a patch that corrects detection of toolchain stack protector support when
 > libssp is missing.

 > Fixes:
 > http://autobuild.buildroot.net/results/497/497d2739c27ce0dcf91bdf2f87c02fc169ba9071/
 > http://autobuild.buildroot.net/results/f71/f71a4bbca2505fcacb396bcc643c7152d87b5283/
 > http://autobuild.buildroot.net/results/85d/85da63d49086f8cc62e2c67632dfdc39d7702169/

 > and more.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
