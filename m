From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 16 Apr 2015 16:58:20 -0300
Subject: [Buildroot] [PATCH 2/2] samba4: bump to version 4.2.0
In-Reply-To: <20150416195525.GK27057@waldemar-brodkorb.de>
References: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>
 <1425588249-20942-2-git-send-email-gustavo@zacarias.com.ar>
 <XnsA4777FCDAF5A6berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <55265956.3020607@zacarias.com.ar>
 <20150409202054.GD27057@waldemar-brodkorb.de>
 <5527BF02.6060304@zacarias.com.ar>
 <20150416195525.GK27057@waldemar-brodkorb.de>
Message-ID: <5530145C.8000308@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/16/2015 04:55 PM, Waldemar Brodkorb wrote:

> It is not a missing or broken $ORIGIN support. As you posted, there
> is no $ORIGIN used in RPATH.
> I am really sure it is this commit and option which is solving the
> runtime problem:
> http://git.uclibc.org/uClibc/commit/?id=409f14d9b5e47513d5c939120a33965997c8ceb2
> 
> Will be part of uClibc-ng 1.0.2.

In any case it's just the comment that's wrong but the conditions are
the same, current releases are not up to snuff.
We can revisit that when there are newer releases, even though i think
samba is a big enough package that any uclibc* space savings are
pointless, after all it needs to share some storage besides the obvious
firmware size and RAM requirements.
Regards.
