From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Jan 2021 22:43:38 +0100
Subject: [Buildroot] : How to add a path to environment variable ?
In-Reply-To: <20210121204741.08247783@windsurf.home>
References: <CAGshWo0jnJNF-v=-WJH9tUH4CAtzZY9XwrPTgUeBhgyeRfKMzw@mail.gmail.com>
 <20210121174729.31850f5c@windsurf.home>
 <CAGshWo2KMW3VvWSGeOvqqhvi3z-Onn_hdyA-4Yjb=YEKdUDuTw@mail.gmail.com>
 <20210121204741.08247783@windsurf.home>
Message-ID: <20210121214338.GD2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Manu, All,

On 2021-01-21 20:47 +0100, Thomas Petazzoni spake thusly:
> On Thu, 21 Jan 2021 18:02:39 +0100
> manu f <e.fiancette@gmail.com> wrote:
> > Thanks for your suggestion!
> > in the last buildroot version, nodejs is deprecated!
> > So I use my own compiled version of nodejs.
> 
> Deprecated ? We definitely still have a nodejs package, and it's not
> deprecated at all.

I think Manu meant that the version of nodejs we cary is depreceated.

Indeed, we still have nodejs 12.20.1, which is not the latest.

However, it is not deprecated. 12.x is in maintenance-only now, until
around May 2022, which means we cary a stable version, on which people
can be sure no API breakage will occur; only bug fixes and security
fixes will be applied (in practice, only security fixes).

The other LTS, 14.x, will continue to receive evolutions until Oct.
2021, after which it will enter maintainance-only mode. So it is
currently not as stable as 12.x.

15.s will not be an LTS, and will disapear around end os S1 2021.

16.x is not even released yet, and will be the next LTS.

So in the end, I would not qualify our version of being deprecated; it's
just not the latest LTS.

12.x is stable, and a good fit I believe for our next LTS.

Note: I am *not* arguing for having two versions of nodejs in the tree.
No, no, no! ;-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
