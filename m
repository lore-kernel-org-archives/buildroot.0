From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 Aug 2014 18:44:22 +0200
Subject: [Buildroot] [PATCH] package/erlang: build host erlang with ssl
 support to match target
In-Reply-To: <20140815182927.4731c6e6@free-electrons.com>
References: <1407968827-12487-1-git-send-email-yann.morin.1998@free.fr>
 <20140815103634.00751fb4@free-electrons.com>
 <CA+-urNQ5OWd9ZF3xeOVnPz7QZDuJiNjgv3RGhP+iPVjB9hbzdw@mail.gmail.com>
 <20140815154344.GA3863@free.fr>
 <20140815182927.4731c6e6@free-electrons.com>
Message-ID: <20140815164422.GA3998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-08-15 18:29 +0200, Thomas Petazzoni spake thusly:
> On Fri, 15 Aug 2014 17:43:44 +0200, Yann E. MORIN wrote:
> 
> > > After more thought, I think that the reasoning should be that the
> > > common Erlang build tools reference openssl. (openssl is used for
> > > Erlang's crypto support, so the moment you run code that computes a
> > > SHA1, you need it.) I'd be fine with host-erlang always having ssl
> > > enabled since the error message you get when you don't have it enabled
> > > is not obvious to anyone who doesn't use Erlang.
> > 
> > Yes, after giving it more thought, and your input above, I believe we
> > should always build host-erlang with SSL support.
> > 
> > I'll update my patch accordingly.
> 
> Can you include in the commit log the rationale for this change?

Err.. I think I did, didn't I?
    http://patchwork.ozlabs.org/patch/380305/

;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
