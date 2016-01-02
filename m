From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jan 2016 22:04:57 +0100
Subject: [Buildroot] [PATCH] python-can: bump to 1.4.1
In-Reply-To: <20160102111529.GG3477@free.fr>
References: <1451686709-25501-1-git-send-email-yegorslists@googlemail.com>
 <20160101222835.GD2182@free.fr> <20160101224914.GE2182@free.fr>
 <CAGm1_ktsesfzLN6GKBuNviVc1Yn-_XegksJyLuycxY+heXy=VQ@mail.gmail.com>
 <20160102111529.GG3477@free.fr>
Message-ID: <56883B79.2050806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02-01-16 12:15, Yann E. MORIN wrote:
> Yegor, All,
> 

[snip]

> Still, I think we should use upstream locations, not some packaging
> location. For example, switching to PyPi for Python packages would be
> like switching to Debian for 'native' packages. We don't do that (except
> when upstream has disapeared, is acting...)

 This analogy is not quite correct. PyPi is a distribution channel, not a
downstream. Not that I can think of a better analogy though. But the important
thing is: the PyPi location is under control of the upstream author, so it is
equally upstream as the git repo. Brian Thorne (the python-can author) doesn't
upload tarballs to the bitbucket location (you only get the automatic ones), but
only to PyPi. So there really is something to be said for using PyPi as the
download location.

> 
> The argument about the hash is only patially valid: md5 is long dead
> now, and you still have to compute a sha256 anyway.

 Very true.

 Basically I'm OK with either location.

 Regards,
 Arnout

> 
> But as seen on IRC: let's see what others think.
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
