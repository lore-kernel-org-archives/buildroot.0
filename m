From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 08 Dec 2014 21:00:56 +0100
Subject: [Buildroot] [git commit] pkg-download: VERIFY_HASH: use same
	hash file for host and target downloads
In-Reply-To: <20141208180024.GD4105@free.fr> (Yann E. MORIN's message of "Mon, 
 8 Dec 2014 19:00:24 +0100")
References: <20141208075330.0542F80144@busybox.osuosl.org>
 <20141208180024.GD4105@free.fr>
Message-ID: <87egs9vrlz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2014-12-08 08:52 +0100, Peter Korsgaard spake thusly:
 >> commit: http://git.buildroot.net/buildroot/commit/?id=cf902845e7c23da7acddd82dc591255e4657d730
 >> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> Fixes (or atleast stops the build with a saner description):
 >> http://autobuild.buildroot.net/results/1a9/1a9643f8633db038d4fe5ca4a32e4d52e70a3a1a/
 >> 
 >> We're using the same sources for host and target downloads, so it makes
 >> sense to use the same <pkg>.hash file as well to ensure the host version
 >> gets verified without us having to maintain a seperate host-<pkg>.hash file.

 > Damn, I had this in my download-hash series:
 >     http://lists.busybox.net/pipermail/buildroot/2014-December/114493.html

 > I'll have to rebase it now... Hehe! ;-p

Argh, sorry - I just noticed it this morning when I looked at the
autobuilder issues.

I'll get to review your series this week.

-- 
Venlig hilsen,
Peter Korsgaard 
