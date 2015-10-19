From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Oct 2015 22:55:56 +0200
Subject: [Buildroot] [PATCH v3 1/1] nwipe: new package
In-Reply-To: <CAEHm_si6eCN38v7ffgSZJwngc+JiZ9hoxQ4sY=1tKPsWOefccQ@mail.gmail.com>
References: <1445114199-14261-1-git-send-email-charles@dyfis.net>
 <20151017211352.GD32247@free.fr>
 <CAEHm_si6eCN38v7ffgSZJwngc+JiZ9hoxQ4sY=1tKPsWOefccQ@mail.gmail.com>
Message-ID: <20151019205556.GF3651@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Charles, All,

On 2015-10-19 20:44 +0000, Charles Duffy spake thusly:
> > > +NWIPE_VERSION = 0.17
> > You should probably use the latest commit. 0.17 is more than one-year
> > old, and there have been a few fixes applied to the tree since then.
> 
> In v4, I moved to 8a9a71822148cb9c82d971030dafd8d374fd1f48, which appeared
> to be the latest commit -- but, looking back on it, I realize that this
> changeset is even with the 0.17 tag!
> 
> Am I missing a development branch elsewhere?

No, you are right. It's just that their commit history is weird
(top-most is latest)

    $ git log --oneline
    8a9a718 remove test file
    a86f366 Missed if statement
    e1627b3 Patch nwipe.c to fix Debian bug #755473 (thanks Mark Feenstra).
    167e478 Change start key to S instead of F10.
    5a63140 Update version to 0.17
    [...]

So it seemed to me that there were 4 commits after the 0.17 release. But
since I read what you said above, I lloke more carefully:

    $ git log --oneline --decorate
    8a9a718 (HEAD, tag: 0.17, origin/master, origin/development, origin/HEAD, master) remove test file
    a86f366 Missed if statement
    e1627b3 Patch nwipe.c to fix Debian bug #755473 (thanks Mark Feenstra).
    167e478 Change start key to S instead of F10.
    5a63140 Update version to 0.17

Dang. 0.17 is OK, then. Sorry for the noise...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
