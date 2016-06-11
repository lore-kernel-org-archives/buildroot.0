From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Jun 2016 11:41:40 +0200
Subject: [Buildroot] change lirc to new version
In-Reply-To: <CAG7w3y=cPNCEgkWrhLZtzbQOwXbUesBanmq1JDeJ9XA9t4g8Fw@mail.gmail.com>
References: <CAG7w3y=cPNCEgkWrhLZtzbQOwXbUesBanmq1JDeJ9XA9t4g8Fw@mail.gmail.com>
Message-ID: <20160611094140.GA3696@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gdbabu, All,

On 2016-06-11 12:58 +0530, gdbabu Krishnan spake thusly:
> i am currently using buildroot for raspberry pi, i am using lircd version
> 0.9.3a it does not forward KEY event to UINPUT.
> 
> so i want to use latest version of lircd, could you tell me how to change
> lirc package in buildroot.

See in package/lirc-tools/lirc-tools.mk

Note that you'll have to check a few things, besides bumping the
version:
  - is our patch still needed?
  - if so, does it still apply?
  - are there new depednencies?
  - are there new options?

and so on... You may have to investigate a bit to do the bump.

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
