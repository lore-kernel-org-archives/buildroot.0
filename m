From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Mon, 13 Aug 2012 21:43:24 +0200
Subject: [Buildroot] git clone with http not giving me commits after Jul
 6
In-Reply-To: <20120813121005.3aeda200@cfl-science.lanl.gov>
References: <20120813121005.3aeda200@cfl-science.lanl.gov>
Message-ID: <502958DC.3050705@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Neale,

I use another URL an get all the tags and branches like seen on
http://git.buildroot.net/buildroot/ .

> carsten at wheezy:~/gitprojects/buildroot [master]$ grep "url"  .git/config 
> 	url = git://git.busybox.net/buildroot

Do you have checked the output of 'git branch -a' and 'git tag -l'?

Regards
Carsten

and now to the ML :)

Am 13.08.2012 20:10, schrieb Neale Pickett:
> I just did a new clone of buildroot with
> 
>     git clone http://git.buildroot.net/git/buildroot.git
> 
> The most recent commit is dated
> 
>     Date:   Fri Jul 6 02:57:33 2012 +0000
> 
> In particular, I don't have the 2012.08_rc1 tag.
> 
