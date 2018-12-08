From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Dec 2018 13:00:50 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-12-04
In-Reply-To: <87efaujzby.fsf@tkos.co.il> (Baruch Siach's message of "Thu, 06
 Dec 2018 20:16:01 +0200")
References: <20181205070024.027E420A59@mail.bootlin.com>
 <CAMRc=MeKx3DWa6DZs3h7MH2uuJusBr08+ycoOnX3Drsmw22JWQ@mail.gmail.com>
 <f3cpi33oica7lbub1hjw72x0.1544043243948@email.android.com>
 <87efaujzby.fsf@tkos.co.il>
Message-ID: <875zw45itp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi David,
 > David J. Fogle writes:
 >> Is this patch going to be put into 2018.11, or is this going into
 >> 2019.02. I am rather new to your project, forgive me not knowing how
 >> your patch cycle works.

 > This patch fixes an issue in the current master branch. So this patch
 > (or a better one) will be applied to that branch. The master branch will
 > be released as 2019.02.

 > Patches fixing issues that affect stable branches (currently 2018.08.x
 > and 2018.02.x are maintained) will be backported to these branches. In
 > the case of this patch, stable branches seem not to be affected. The
 > build failure trigger is the bump of pulseview to version 0.4.1. This
 > bump is not in the stable branches.

Correct. Notice that I will create a 2018.11.x branch this weekend and
start maintaining that instead of 2018.08.x.

-- 
Bye, Peter Korsgaard
