From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 12 Jun 2008 10:42:30 +0200
Subject: [Buildroot] Still no answer for a contribution made in March
In-Reply-To: <20080612095933.25f3345e@crazy> (Thomas Petazzoni's message of
	"Thu\, 12 Jun 2008 09\:59\:33 +0200")
References: <20080611161156.33737116@crazy>
	<46a136670806110808x737929a4red33f32c593ae6e2@mail.gmail.com>
	<20080611154121.GI3795@mx.loc> <20080612095933.25f3345e@crazy>
Message-ID: <871w33doy1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Yea, and that's the reason why the svn-repo is completely fux0red up.

 Thomas> I don't necessarly think so. Here, the issue is not a bottleneck at the
 Thomas> commit level, but rather a patch review bandwidth problem.

Agree - And lack of testing before stuff gets checked in. The deeper
issue is that we don't do releases I guess, so there's a tension
between doing development, and having something stable for actual use.

I have gotten a login to the gcc cluster, and have plans to setup a
buildbot instance to do regression tests on buildroot.

 Thomas> What's the relationship between your Git repo and the
 Thomas> official Subversion tree ? When is your tree pulled into the
 Thomas> official Subversion tree ? Who review the patches and when ?

Bernard's git tree is a fork of the svn repo from some time
ago. There's no official sync, but he sometimes cherrypicks commits
from svn, and I sometimes do the same from his tree.

It's a pity, but has historical reasons.

-- 
Bye, Peter Korsgaard
