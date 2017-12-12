From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Dec 2017 11:17:37 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2017-12-08
In-Reply-To: <20171212100557.025991d0@windsurf.png.is.keysight.com> (Thomas
 Petazzoni's message of "Tue, 12 Dec 2017 10:05:57 +0100")
References: <20171209070008.CDCD1209E0@mail.free-electrons.com>
 <6615b66f-2eec-d2f9-5284-20df852ca049@grinn-global.com>
 <20171212100557.025991d0@windsurf.png.is.keysight.com>
Message-ID: <87374guu66.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue, 12 Dec 2017 09:59:42 +0100, Marcin Niestroj wrote:
 >> Hi Thomas,
 >> 
 >> Commit d1839b7f0e7c6be2e90887b27dee58d9a0441771
 >> ("package/turbolua: Fix build with gcc7") already fixes that issue
 >> on Buildroot master branch.

 > Thanks for reporting this. Peter, could you backport
 > d1839b7f0e7c6be2e90887b27dee58d9a0441771 to the 2017.08.x branch ?

Done, thanks.

I would like to retire 2017.08.x now that 2017.11 is out. I'll get
2017.11.x started later this week so we can adjust the autobuilders to
run on that branch instead of 2017.08.x.

-- 
Bye, Peter Korsgaard
