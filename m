From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 16 Oct 2012 21:04:15 +0200
Subject: [Buildroot] [git commit] package: add gnupg
In-Reply-To: <20121016185610.36a03eff@skate> (Thomas Petazzoni's message of
 "Tue, 16 Oct 2012 18:56:10 +0200")
References: <20121015082204.6813A99871@busybox.osuosl.org>
 <20121016185610.36a03eff@skate>
Message-ID: <87ipaatf0w.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> 3 files changed, 84 insertions(+), 0 deletions(-)

 Thomas> This is causing the following build breakage on various platforms:

 Thomas>   http://autobuild.buildroot.org/results/07f97705dda6dfbeab8ce95d6cef5b016329c9ce/build-end.log

Yes - I noticed as well, just haven't found time to look closely at it
yet. The mpi stuff has cpu specific backends, so that's probably where
it goes wrong.

-- 
Bye, Peter Korsgaard
