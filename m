From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 06 Sep 2013 22:53:53 +0200
Subject: [Buildroot] [git commit] uclibc: add upstream 0.9.33 fixes
In-Reply-To: <20130906163551.571faf5c@skate> (Thomas Petazzoni's message of
 "Fri, 6 Sep 2013 16:35:51 +0200")
References: <20130906133535.2BD969A98A@busybox.osuosl.org>
 <20130906163551.571faf5c@skate>
Message-ID: <87ppsl1xjy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Drop uclibc-0002-Add-definition-of-MSG_WAITFORONE-and-MSG_CMSG_CMSG_CLOEXE.patch
 >> as that is a subset of uclibc-0035-socket.h-pull-socket_type.h-from-eglibc.patch

 Thomas> Shouldn't we switch to using the git version of uClibc instead of
 Thomas> carrying 40+ patches? The uClibc project seems to have issues getting
 Thomas> releases out, maybe we should just use their git version, and bump it
 Thomas> from time to time when appropriate?

Yes, Perhaps. When I started this, I only thought I would add 2-3
patches to fix the eventfd issue - but looking closer, the other patches
seemed worthwhile as well.

We do carry a few patches that aren't (yet?) part of upstream git on the
0.9.33 branch, so it wouldn't get rid of all patches (but most). Another
potential issue is that git almost becomes a hard buildroot dependency,
but that's probably not a big problem.

What do others say?

-- 
Bye, Peter Korsgaard
