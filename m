From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Jun 2015 11:05:02 -0300
Subject: [Buildroot] [PATCH] openvmtools: fix legal info
In-Reply-To: <558815B4.5010208@lucaceresoli.net>
References: <1434885903-22713-1-git-send-email-gustavo@zacarias.com.ar>
 <CABbD_XDeC4jX6bS7wtjRpXoSNv6VSLTywhyJEx5K+gQw7-XSUg@mail.gmail.com>
 <5586A95F.4010501@zacarias.com.ar> <558815B4.5010208@lucaceresoli.net>
Message-ID: <5588160E.3050602@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22/06/15 11:03, Luca Ceresoli wrote:

> ...we have them! :( Here's a couple examples:
>
> $ git grep -E '_(LICENSE_FILES|SUBDIR) =' -- package/samba
> package/berkeleydb/
> package/berkeleydb/berkeleydb.mk:BERKELEYDB_SUBDIR = build_unix
> package/berkeleydb/berkeleydb.mk:BERKELEYDB_LICENSE_FILES = LICENSE
> package/samba/samba.mk:SAMBA_SUBDIR = source3
> package/samba/samba.mk:SAMBA_LICENSE_FILES = COPYING
> $
>
> Setting SAMBA_LICENSE_FILES to ../COPYING does not look very nice to me.

D'oh!
Samba is going away, it's already deprecated in favour of samba4, but it 
still leaves berkeleydb.
Regards.
