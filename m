From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 10 Oct 2015 14:43:35 +0200
Subject: [Buildroot] [PATCH v3 02/37] package/expedite: move to package
 directory
In-Reply-To: <20151010125428.002de0af@free-electrons.com>
References: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
 <1444471422-15118-3-git-send-email-romain.naour@openwide.fr>
 <20151010125428.002de0af@free-electrons.com>
Message-ID: <561907F7.5070308@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 10/10/2015 12:54, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Sat, 10 Oct 2015 12:03:07 +0200, Romain Naour wrote:
>> Add efl reverse dependencies.
> 
> This is a bit of a poor commit log. Why do you move expedite to the
> package/ directory? And what does it mean to "add reverse
> dependencies" ?

Ok, I'll complete the commit log with this:

"We usually do not have a sub-directory for a family of related packages, so
move expedite to package directory.
Since expedite now select the efl package, propagate the reverse dependencies on
mmu and wchar."

I'll fixes that also in the following patches.

> 
> Also, it seems like you don't have rename detection enabled in Git.

Indeed, sorry for that... The patch generated with git format-patch didn't look
like the one viewed through gitk.
I fixed that using:
git config --global diff.renames copies

Also the following patches moving efl packages to package directory have the
same issue...

Best regards,
Romain

> 
> Thanks,
> 
> Thomas
> 
