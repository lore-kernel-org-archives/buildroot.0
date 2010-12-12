From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Dec 2010 23:53:37 +0100
Subject: [Buildroot] [PATCH 07/15] ltp-testsuite: bump version and use
	autotargets
In-Reply-To: <20101212234625.29f64f1a@surf> (Thomas Petazzoni's message of
	"Sun, 12 Dec 2010 23:46:25 +0100")
References: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<c3f16255f702a6cdd4936c2c91d13ac61db35c82.1291541115.git.thomas.petazzoni@free-electrons.com>
	<87bp4slyo4.fsf@macbook.be.48ers.dk> <20101212123150.77a2569e@surf>
	<87aakaljiz.fsf@macbook.be.48ers.dk> <20101212234625.29f64f1a@surf>
Message-ID: <8762uyli1a.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> So you mean that just like for mrouted, I should allow the
 Thomas> selection of ltp-testsuite with uClibc, even though it would
 Thomas> not build with our default uClibc configuration ?

Yes.

 >> We could ofcourse add toolchain knobs for all of these, but as you say
 >> they are probably not worth the effort / extra complexity. I think
 >> just leaving them like this is good enough.

 Thomas> Obviously, I don't think it's reasonable to add dozens of toolchain
 Thomas> configuration knobs.

Me neither.

-- 
Bye, Peter Korsgaard
