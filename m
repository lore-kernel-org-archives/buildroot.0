From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Sep 2010 15:04:59 +0200
Subject: [Buildroot] About Git through SSH
In-Reply-To: <201009030730.57559.minimod@morethan.org>
References: <1283422191-30926-1-git-send-email-maxime.petazzoni@bulix.org>
	<201009020737.45906.minimod@morethan.org>
	<20100902145015.7e646a8b@surf>
	<201009030730.57559.minimod@morethan.org>
Message-ID: <20100903150459.059d682a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 3 Sep 2010 07:30:54 -0500
"Michael S. Zick" <minimod@morethan.org> wrote:

> Yup.
> Please supply git version number(s).

Just the normal Git from the latest Ubuntu, i.e:

$ git --version
git version 1.7.0.4

> Any additional patches or local changes / customizations to your git
> client?

No, nothing. I think as soon as your user has write access to the remote
location through SSH, git just works.

However, as I said:

> > As far as I see, Gitolite introduces per-branch or per-tag
> > permissions, but plain Git already allows per-repository
> > permissions. No ?

Maybe that's what you're looking for and which is not supported by
standard git.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
