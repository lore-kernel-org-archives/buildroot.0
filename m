From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Sep 2012 08:35:24 +0200
Subject: [Buildroot] problem with sudo patch file name
In-Reply-To: <CANxTyt5k19J-iyEXg4FZfmtNZVJL+qnCKYUo9PSeGf=D5C6NJw@mail.gmail.com>
 (Danomi Manchego's message of "Fri, 7 Sep 2012 22:01:23 -0400")
References: <CANxTyt5k19J-iyEXg4FZfmtNZVJL+qnCKYUo9PSeGf=D5C6NJw@mail.gmail.com>
Message-ID: <87har61j2r.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 Danomi> Hi,
 Danomi> I recently started to update our project to buildroot-2012.08. ?When I went to
 Danomi> check into source control, I got an error from this file:

 Danomi> ? ? package/sudo/
 Danomi> sudo-1.8.5p2-backport-commit-8209:0c4e3f68b2f5-from-upstream.patch

 Danomi> The problem is the colon (":") in the file name. ?I think the
 Danomi> problem is that our source control system is on a Windows
 Danomi> server

 Danomi> Would there be interest in a patch that renames this file to
 Danomi> remove the colon?  ?We could change the colon to an underscore
 Danomi> or dash, but I see that the upstream commit number is in a
 Danomi> comment at the top of the patch, so I don't know that naming
 Danomi> the file after the upstream commit number is actually helpful.
 Danomi> ?Maybe "sudo-1.8.5p2-backport-cross-compile-fix.patch" would be
 Danomi> better?

Thanks for the heads up. Instead of renaming the file I bumped the sudo
package to the recent 1.8.6 release (so we don't need the patch any
more), but I'll try to remember for the future.

-- 
Bye, Peter Korsgaard
