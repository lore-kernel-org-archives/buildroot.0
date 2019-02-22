From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 22 Feb 2019 21:46:46 +0100
Subject: [Buildroot] Runtime test issues
In-Reply-To: <20190213222533.35cac79e@windsurf>
References: <20190213222533.35cac79e@windsurf>
Message-ID: <20190222214646.03209aba@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Feb 2019 22:25:33 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Fran?ois, the following tests are failing:
> 
>  - tests.package.test_perl_dbd_mysql.TestPerlDBDmysql
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/158295305

Fran?ois, any news about this one ?

>  - tests.package.test_prosody.TestProsodyLuajit
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/158295315
> 
>  - tests.package.test_prosody.TestProsodyLua51
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/158295314

For those ones, you have sent:

Subject: [Buildroot] [PATCH] luaexpat: restore getcurrentbytecount (required  by prosody)
Date: Tue, 19 Feb 2019 08:24:09 +0100

I will have a look at it.

> Ricardo, the following test is failing:
> 
>  - tests.download.test_git.TestGitRefs
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/158295269

Ricardo, I saw you discussed this issue with Arnout. Any conclusion ?

> Yann, the following tests are failing:
> 
>  - tests.init.test_systemd.TestInitSystemSystemdRoFull
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/158295290
> 
>  - tests.init.test_systemd.TestInitSystemSystemdRwFull
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/158295293
> 
>  - tests.init.test_systemd.TestInitSystemSystemdRoNetworkd
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/158295292
> 
>  - tests.init.test_systemd.TestInitSystemSystemdRwNetworkd 	
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/158295295

Yann, any news about those failures? They are still occurring on the
current master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
