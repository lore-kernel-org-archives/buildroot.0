From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Aug 2015 23:33:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/arptables: fix musl compilation
 issues
In-Reply-To: <CA+BsyQ7D9PjQaA45GXfbHFAnUaD76+_4mcY6QiBBNEtjU3GCkQ@mail.gmail.com>
References: <1438542614-2069-1-git-send-email-brendanheading@gmail.com>
 <20150802201211.GJ3647@free.fr>
 <CA+BsyQ7D9PjQaA45GXfbHFAnUaD76+_4mcY6QiBBNEtjU3GCkQ@mail.gmail.com>
Message-ID: <20150802213335.GK3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brendan, All,

On 2015-08-02 22:28 +0100, Brendan Heading spake thusly:
> > This is not exactly the patch that was applied by upstream:
> >     http://git.netfilter.org/arptables/commit/?id=047f37b1d5d865084a435fd7594b8c5c332ccb8d
> > The patch you provide is missing two hunks which are upstream...
> That is correct - I had to rebase the patch against the 0.14 release
> (it did not apply cleanly).

Ah, OK, you should have said so, then.

Care to resend with that comment added to the patch' commit log, plesae?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
