From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Aug 2014 12:13:51 +0200
Subject: [Buildroot] [PATCH v3] ejabberd: new package
In-Reply-To: <CAJtjsKaffjozKTpXK=h+Quc6q36Aw0cieFG=qaaXb6=-R5tW+A@mail.gmail.com>
References: <1405686837-1418-1-git-send-email-johan.oudinet@gmail.com>
 <20140806202322.GE1587@free.fr>
 <CAJtjsKZan0d6fSg3HuT4gm4+09Cqej3NbFbFZNU+mh5YNPFEdQ@mail.gmail.com>
 <CAJtjsKaffjozKTpXK=h+Quc6q36Aw0cieFG=qaaXb6=-R5tW+A@mail.gmail.com>
Message-ID: <20140811101351.GA4364@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan, All,

On 2014-08-11 12:07 +0200, Johan Oudinet spake thusly:
> On Mon, Aug 11, 2014 at 11:36 AM, Johan Oudinet <johan.oudinet@gmail.com> wrote:
> > In the meantime, I'll try with yours.
> 
> I've just tried with your minimal defconfig and the compilation
> finished without an error :-/
> I did a make clean after modifying the defconfig. Should I do something else?

Yes, please: could you de-install any erlang on your host system, and be
sure that the one in use is undeed the one built by Buildroot.

I do not have erlang installed on my machine, for the records.

Also, I'm building your configuration right now, I'll let you know how
that goes...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
