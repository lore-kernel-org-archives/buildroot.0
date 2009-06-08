From: Paul Archer <ptarcher@gmail.com>
Date: Tue, 9 Jun 2009 09:35:08 +1000
Subject: [Buildroot] git upgrade question
In-Reply-To: <4A2CB6E0.2090807@ethertek.ca>
References: <4A2CB6E0.2090807@ethertek.ca>
Message-ID: <56ea0bb80906081635w272c6f4bqce492c08c8ef5b85@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If you are working on the release you can patch create a patch from
the 2009.02 release via

$ diff -u original-release-directory/ updated-directory/  > changes.patch
$ cd newest-release
$ patch -p1 < changes.patch

If you have used git to grab the checkout of the 2009.02 you can
re-base your changes (but I don't know how to do that). That or just
do an update and git should figure out what you have changed and what
has changed in since 2009.02 in the official tree.

Regards Paul

On Mon, Jun 8, 2009 at 4:59 PM, Dan Pattison<dan.pattison@ethertek.ca> wrote:
> Hello List,
>
> I am using the 2009.02 release of BuildRoot. Is there any way using git to
> upgrade to 2009.05 without wiping out all of my changes and customizations?
> I have browsed the git website but found nothing about upgrading a build
> environment started with svn. Is there a git command to do this?
>
> Thanks,
> Dan Pattison
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
----
Regards
Paul Archer
ptarcher at gmail.com
