From: Mike Williams <mike@mikebwilliams.com>
Date: Wed, 7 Oct 2015 12:19:52 -0400
Subject: [Buildroot] [PATCH] system: add options for /bin /sbin and /lib
 to be symlinks into /usr
In-Reply-To: <87vbbcznmq.fsf@dell.be.48ers.dk>
References: <1441324062-31743-1-git-send-email-yann.morin.1998@free.fr>
 <20150904101128.4206779d@free-electrons.com>
 <55E9540C.9060000@mind.be> <20150904163121.GD4540@free.fr>
 <8737yg3dt0.fsf@dell.be.48ers.dk> <55F73B74.1020708@mind.be>
 <87vbbcznmq.fsf@dell.be.48ers.dk>
Message-ID: <CANPyyuP3SBaEfR68jL=OqQqfkLov=1GLjW-r05CsOQgEOHY=Fg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

  >  However, I'm not really in favour of it. I don't see that it brings
>  > a lot of benefit, other than reducing the number of symlinks from 3
>  > to 1. But it does create /share and /local which looks weird could
>  > potentially conflict with existing user directories (e.g. a
>  > mountpoint for windows shares...). Also it makes it more complicated
>  > for the user to implement a fedora-like mounted /usr.
>
> Ok - fine, having 1 or 3 symlinks isn't really a big deal. Just symlinking
> /usr
> seemed the simplest possible solution.
>

Any reason this wasn't committed? Just reviewing my list of out-of-tree
patches...

Mike
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151007/bd96b48b/attachment.html>
