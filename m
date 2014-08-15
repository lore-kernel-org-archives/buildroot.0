From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 Aug 2014 17:43:44 +0200
Subject: [Buildroot] [PATCH] package/erlang: build host erlang with ssl
 support to match target
In-Reply-To: <CA+-urNQ5OWd9ZF3xeOVnPz7QZDuJiNjgv3RGhP+iPVjB9hbzdw@mail.gmail.com>
References: <1407968827-12487-1-git-send-email-yann.morin.1998@free.fr>
 <20140815103634.00751fb4@free-electrons.com>
 <CA+-urNQ5OWd9ZF3xeOVnPz7QZDuJiNjgv3RGhP+iPVjB9hbzdw@mail.gmail.com>
Message-ID: <20140815154344.GA3863@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Frank, All,

On 2014-08-15 08:33 -0400, Frank Hunleth spake thusly:
> On Fri, Aug 15, 2014 at 4:36 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Dear Yann E. MORIN,
> >
> > On Thu, 14 Aug 2014 00:27:07 +0200, Yann E. MORIN wrote:
> >
> >> If the target erlang has SSL support, so shoud the host-erlang.
> >
> > Why?
> 
> After more thought, I think that the reasoning should be that the
> common Erlang build tools reference openssl. (openssl is used for
> Erlang's crypto support, so the moment you run code that computes a
> SHA1, you need it.) I'd be fine with host-erlang always having ssl
> enabled since the error message you get when you don't have it enabled
> is not obvious to anyone who doesn't use Erlang.

Yes, after giving it more thought, and your input above, I believe we
should always build host-erlang with SSL support.

I'll update my patch accordingly.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
