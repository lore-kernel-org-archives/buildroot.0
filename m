From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Feb 2017 20:37:50 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-13
In-Reply-To: <20170214180232.u2m4hirisgquonui@tarshish> (Baruch Siach's
 message of "Tue, 14 Feb 2017 20:02:32 +0200")
References: <20170214072856.3AE8320B8C@mail.free-electrons.com>
 <20170214142725.1b9e98ae@free-electrons.com>
 <20170214180232.u2m4hirisgquonui@tarshish>
Message-ID: <87r330imwh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Thomas,
 > On Tue, Feb 14, 2017 at 02:27:25PM +0100, Thomas Petazzoni wrote: 
 >> > x86_64 | tcpreplay-4.1.2 | NOK |
 >> http://autobuild.buildroot.net/results/b3c31e803ff552a196ce5717372c09d6f64c91bf
 >> 
 >> error: redefinition of 'struct ethhdr'
 >> 
 >> I believe this has been fixed by the rebuild of the toolchains I
 >> deployed yesterday, which has the improvements done by Baruch. Baruch,
 >> could you confirm?

 > I confirmed the tcpreplay builds successfully with the newly built 2017.02-rc1 
 > based x86-64-musl toolchain.

Ok, great!

-- 
Bye, Peter Korsgaard
