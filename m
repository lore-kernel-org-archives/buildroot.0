From: MERCADIER Johann <johann.mercadier@imerir.com>
Date: Tue, 27 Mar 2012 20:24:53 +0100
Subject: [Buildroot] GIT :: signing issue
Message-ID: <CAPEB33xD5-OZSwNs-uuB1igho1jJHHDJ0i+F=McOn=KqA9P8TA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
  my signature do not conform with the licence as my full name should be
written and not just the initials.
  So I have modified git config as is:
___[ SHELL
]____________________________________________________________________________
$ git repo-config --list
user.name=Johann MERCADIER
user.email=johann.mercadier at imerir.com
core.repositoryformatversion=0
core.filemode=true
core.bare=false
core.logallrefupdates=true
remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
remote.origin.url=git://git.buildroot.net/buildroot
branch.master.remote=origin
branch.master.merge=refs/heads/master
sendemail.chainreplyto=false
user.name=Johann MERCADIER
user.email=johann.mercadier at imerir.com

$ tail ~/.bashrc

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
export GIT_AUTHOR_NAME="Johann MERCADIER"
export GIT_COMMITTER_NAME="Johann MERCADIER"
export GIT_AUTHOR_EMAIL="johann.mercadier at imerir.com"
_________________________________________________________________________________________

But when I create the patch and try to send it I still have:

Send this email? ([y]es|[n]o|[q]uit|[a]ll): n
(mbox) Adding cc: JoM <johann.mercadier@imerir.com> from line 'From: JoM <
johann.mercadier@imerir.com>'

                                /\
Where these initials come from___________________________________/
I don't know where I can modify them and didn't found anything relevant on
the net... If someone as a clue it could help me finish to add definitively
this patch.

Thanks.

-- 
Cordialement.

___Johann MERCADIER___

:(){ :|:& };:
"I am the Unknown lead by the Unknowing.
I have done so much with so little for so long
that I am now qualified to do anything with nothing."
HOOSEEK (http://www.hooseek.com/) 1?moteur de recherche solidaire!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120327/184e8e74/attachment.html>
