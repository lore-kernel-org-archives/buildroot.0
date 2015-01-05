From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 5 Jan 2015 01:06:43 +0100
Subject: [Buildroot] [PATCH v4 00/17] ejabberd: XMPP server
In-Reply-To: <1418135662-773-1-git-send-email-johan.oudinet@gmail.com>
References: <1418135662-773-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20150105000643.GG31970@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan, All,

On 2014-12-09 15:34 +0100, Johan Oudinet spake thusly:
> Since ejabberd build system relies on rebar to download its dependencies, we've
> packaged all of them separately and modified ejabberd makefile to not download
> any dependency.
> 
>  package/ejabberd/0001-remove-deps.patch            |  20 ++

Shouldn't we call it erlang-ejabberd as it is an Erlang package using
the rebar infrastructure?

I've pushed my branch there:

    git://git.busybox.net/~ymorin/git/buildroot yem/ejabberd

for you to fetch.

Not even build-tested, I lacked time tonight, will work on it tomorrow.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
