From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Feb 2019 22:25:33 +0100
Subject: [Buildroot] Runtime test issues
Message-ID: <20190213222533.35cac79e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Fran?ois, Ricardo, Yann: you are in Cc because some of the runtime test
cases you added have some issues.

Fran?ois, the following tests are failing:

 - tests.package.test_perl_dbd_mysql.TestPerlDBDmysql
   https://gitlab.com/buildroot.org/buildroot/-/jobs/158295305

 - tests.package.test_prosody.TestProsodyLuajit
   https://gitlab.com/buildroot.org/buildroot/-/jobs/158295315

 - tests.package.test_prosody.TestProsodyLua51
   https://gitlab.com/buildroot.org/buildroot/-/jobs/158295314

Ricardo, the following test is failing:

 - tests.download.test_git.TestGitRefs
   https://gitlab.com/buildroot.org/buildroot/-/jobs/158295269

Yann, the following tests are failing:

 - tests.init.test_systemd.TestInitSystemSystemdRoFull
   https://gitlab.com/buildroot.org/buildroot/-/jobs/158295290

 - tests.init.test_systemd.TestInitSystemSystemdRwFull
   https://gitlab.com/buildroot.org/buildroot/-/jobs/158295293

 - tests.init.test_systemd.TestInitSystemSystemdRoNetworkd
   https://gitlab.com/buildroot.org/buildroot/-/jobs/158295292

 - tests.init.test_systemd.TestInitSystemSystemdRwNetworkd 	
   https://gitlab.com/buildroot.org/buildroot/-/jobs/158295295

Could you have a look at those test failures ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
