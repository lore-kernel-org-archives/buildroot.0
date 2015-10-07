From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Oct 2015 23:03:58 +0100
Subject: [Buildroot] [PATCH] system: add options for /bin /sbin and /lib
 to be symlinks into /usr
In-Reply-To: <CANPyyuP3SBaEfR68jL=OqQqfkLov=1GLjW-r05CsOQgEOHY=Fg@mail.gmail.com>
References: <1441324062-31743-1-git-send-email-yann.morin.1998@free.fr>
 <20150904101128.4206779d@free-electrons.com> <55E9540C.9060000@mind.be>
 <20150904163121.GD4540@free.fr> <8737yg3dt0.fsf@dell.be.48ers.dk>
 <55F73B74.1020708@mind.be> <87vbbcznmq.fsf@dell.be.48ers.dk>
 <CANPyyuP3SBaEfR68jL=OqQqfkLov=1GLjW-r05CsOQgEOHY=Fg@mail.gmail.com>
Message-ID: <561596CE.9080502@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07-10-15 17:19, Mike Williams wrote:
> All,
> 
>       >  However, I'm not really in favour of it. I don't see that it brings
>      > a lot of benefit, other than reducing the number of symlinks from 3
>      > to 1. But it does create /share and /local which looks weird could
>      > potentially conflict with existing user directories (e.g. a
>      > mountpoint for windows shares...). Also it makes it more complicated
>      > for the user to implement a fedora-like mounted /usr.
> 
>     Ok - fine, having 1 or 3 symlinks isn't really a big deal. Just symlinking /usr
>     seemed the simplest possible solution.
> 
> 
> Any reason this wasn't committed? Just reviewing my list of out-of-tree patches...

 Because it is a non-trivial change, and we don't have runtime testing to give
Peter sufficient trust to just commit it, so he will want to look at the patch
in detail before committing. And by now it got snowed under by other patches...

 So it's good that you push for it ;-).


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
