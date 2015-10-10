From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Oct 2015 14:55:56 +0200
Subject: [Buildroot] [PATCH v3 02/37] package/expedite: move to package
 directory
In-Reply-To: <561907F7.5070308@openwide.fr>
References: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
 <1444471422-15118-3-git-send-email-romain.naour@openwide.fr>
 <20151010125428.002de0af@free-electrons.com>
 <561907F7.5070308@openwide.fr>
Message-ID: <20151010145556.59b3543c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 10 Oct 2015 14:43:35 +0200, Romain Naour wrote:

> "We usually do not have a sub-directory for a family of related packages, so
> move expedite to package directory.

This is not exactly true. When they need to share the same version
number (example: qt5), then we do have a sub-directory for a family of
related packages. So I think this should be reworded a bit.

> > Also, it seems like you don't have rename detection enabled in Git.
> 
> Indeed, sorry for that... The patch generated with git format-patch didn't look
> like the one viewed through gitk.
> I fixed that using:
> git config --global diff.renames copies
> 
> Also the following patches moving efl packages to package directory have the
> same issue...

Perfect. It will indeed make the review easier.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
