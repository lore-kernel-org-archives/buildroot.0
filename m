From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Feb 2014 15:42:16 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140214151350.54cb66c5@skate> (Thomas Petazzoni's message of
 "Fri, 14 Feb 2014 15:13:50 +0100")
References: <20140214073009.1D7E6102637@stock.ovh.net>
 <20140214101241.27857b9e@skate>
 <39A54937CC95F24AA2F794E2D2B66B1356C692F6@de02wembxa.internal.synopsys.com>
 <20140214151350.54cb66c5@skate>
Message-ID: <87k3cxn4c7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Yes, it passes for me with the "next" branch.

 > Argh. So libxml2 doesn't build at all on master. This is pretty
 > annoying, because this package has a fairly large number of reverse
 > dependencies, so marking all of them "depends on !BR2_arc" to avoid
 > build problems occurring on master is going to be annoying.

 > I was discussing this morning with better whether he should have merged

s/better/Peter/ ;)

 > your ARC toolchain components bump to master instead of next. He merged
 > in next to be on the safe side, but the consequence is that we have a
 > good number of packages that don't build for ARC in master, causing
 > autobuilder failures, that we know are solved in next.

 > Oh well, I guess it's just a matter of waiting for the release at the
 > end of the month, and get next merged into master.

As I said on IRC, if we think arc will be in a better state with those
bumps cherry picked to master instead, then that's fine for me as well.

-- 
Bye, Peter Korsgaard
