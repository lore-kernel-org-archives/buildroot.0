From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 2 Jan 2014 12:33:16 +0100
Subject: [Buildroot] Generating Buildroot compatible kernel tarball from
 Git
In-Reply-To: <CAP0ktjKKsvyH2GB_c=SJ4zKNwa+xOOYRo9KdhycFtNX=crVtVg@mail.gmail.com>
References: <CAP0ktjJR9UYxM2RuHUgTMWYu7vx2+V-yN31uhScLT53oZAYt4g@mail.gmail.com>
 <CAP0ktjKKsvyH2GB_c=SJ4zKNwa+xOOYRo9KdhycFtNX=crVtVg@mail.gmail.com>
Message-ID: <20140102113316.GA3417@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Anmol, All,

On 2014-01-02 16:58 +0530, Anmol Sarma spake thusly:
> I am trying to modify the default configuration for BeagleBone to use a
> custom tarball instead of a Git tree. I generated a tarball using:
> 
> git archive bb | bzip2 > linux-3.8.13.tar.bz2

You forgot the prefix:

    git archive XXXX --prefix=linux/ |bzip2 ....

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
