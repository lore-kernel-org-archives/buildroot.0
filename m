From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Wed, 13 Nov 2013 08:38:42 +0200
Subject: [Buildroot] [PATCH] qt5base: fix posix_fallocate patch
In-Reply-To: <87d2m52ncu.fsf@dell.be.48ers.dk>
References: <1384299123-6822-1-git-send-email-s.martin49@gmail.com>
 <87d2m52ncu.fsf@dell.be.48ers.dk>
Message-ID: <201311130838.42177.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 13 November 2013 01:48:17 Peter Korsgaard wrote:
> >>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:
> > Fixes:
> > 	http://autobuild.buildroot.net/results/a07/a07c1825a5295a8343cd89f0901d9
> > 	a74a764d804/build-end.log
> 
> Argh - Committed, thanks.
> 
> I did build test the first version of the patch, but not the followup
> fix.

Sorry, I forgot to test it with buildroot after exporting from qtbase 
repository.
