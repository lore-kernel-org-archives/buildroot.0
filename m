From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Aug 2014 18:29:27 +0200
Subject: [Buildroot] [PATCH] package/erlang: build host erlang with ssl
 support to match target
In-Reply-To: <20140815154344.GA3863@free.fr>
References: <1407968827-12487-1-git-send-email-yann.morin.1998@free.fr>
 <20140815103634.00751fb4@free-electrons.com>
 <CA+-urNQ5OWd9ZF3xeOVnPz7QZDuJiNjgv3RGhP+iPVjB9hbzdw@mail.gmail.com>
 <20140815154344.GA3863@free.fr>
Message-ID: <20140815182927.4731c6e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 15 Aug 2014 17:43:44 +0200, Yann E. MORIN wrote:

> > After more thought, I think that the reasoning should be that the
> > common Erlang build tools reference openssl. (openssl is used for
> > Erlang's crypto support, so the moment you run code that computes a
> > SHA1, you need it.) I'd be fine with host-erlang always having ssl
> > enabled since the error message you get when you don't have it enabled
> > is not obvious to anyone who doesn't use Erlang.
> 
> Yes, after giving it more thought, and your input above, I believe we
> should always build host-erlang with SSL support.
> 
> I'll update my patch accordingly.

Can you include in the commit log the rationale for this change?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
