From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 May 2018 23:06:28 +0200
Subject: [Buildroot] [PATCH] host-mkpasswd: fix crash on Fedora 28 build
 host
In-Reply-To: <CAOJ2eMf-+1JfvVcwKKFX1BPj36gbSV+Vc58ShJj61UzrGCe16Q@mail.gmail.com>
References: <20180502090508.12893-1-chemobejk@gmail.com>
 <20180502175722.GA31449@scaer>
 <CAOJ2eMf-+1JfvVcwKKFX1BPj36gbSV+Vc58ShJj61UzrGCe16Q@mail.gmail.com>
Message-ID: <20180502210628.GB2311@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On 2018-05-02 18:23 +0000, Stefan Becker spake thusly:
> On Wed, May 2, 2018 at 8:57 PM Yann E. MORIN < [1]yann.morin.1998@free.fr> wrote:
>   But what if the libxcrypt package is not installed? [...]
> If crypt() is provided by libxcrypt instead of glibc, then this should
> be automatically handled by package dependencies, i.e.
[--SNIP--]
> So at least on Fedora 28 this is handled in a backward compatible way,
> i.e. if I want to compile against glibc I also get libxcrypt-devel and
> therefore crypt.h.

OK, thanks for the explanations on how that's handled in Fedora. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
