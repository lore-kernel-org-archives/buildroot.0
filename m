From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 Jul 2011 19:22:09 +0200
Subject: [Buildroot] Feature request - pull sources from repose
In-Reply-To: <5725744097739393062@unknownmsgid> (James Hanley's message of
 "Thu, 7 Jul 2011 10:06:18 -0400")
References: <5725744097739393062@unknownmsgid>
Message-ID: <87wrfuqa4e.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Hanley <jhanley@dgtlrift.com> writes:

 James> Right now, buildroot downloads sources from released tarball urls, it
 James> would be great if they could also pull from source repositories (git,
 James> svn, etc.) to get unreleased features. For example I ran into an issue
 James> with uclibc which was fixed but not yet released.  It may also assist
 James> in weeding out integration issues before package release.

I see Thomas already answered you, but what problem was this exactly and
what uClibc git commit fixed it? Probably we can backport it to 0.9.32
and include it in buildroot.

-- 
Bye, Peter Korsgaard
