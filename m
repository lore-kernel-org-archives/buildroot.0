From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 20 Mar 2019 03:32:57 -0600
Subject: [Buildroot] [RFC] openssh: add option to allow login as root
In-Reply-To: <20190320092658.GH2702@scaer>
References: <20190319114156.10696-1-esben.haabendal@gmail.com>
 <87mulqebah.fsf@dell.be.48ers.dk>
 <f11c03b3-7edd-5c55-7287-61684f2c9a64@mind.be>
 <87imwdexcs.fsf@dell.be.48ers.dk>
 <CADvTj4q9+uWVE-Yooj7gwVygHca0Y8KiKoHUBtRruf2jzyi8mQ@mail.gmail.com>
 <20190320092658.GH2702@scaer>
Message-ID: <CADvTj4q1VbDewH4HeaScE7_1YHstNzyqvHhrdM8neH0dahRM4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 20, 2019 at 3:27 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2019-03-20 03:05 -0600, James Hilliard spake thusly:
> > One reason for using openssh instead of dropbear without a custom
> > config would be
> > for sftp support.
>
> So we have gesftpserver that can be used with dropbear to provide sftp,
> and AFAICS, that works just out of the box.
Huh, I've never heard of that before and somehow didn't come across it
when I searched for a way to use sftp with dropbear, will try it out.
>
> I don't understand what you mean by "without a custom config".
Oh, that was in reference to the comment above yours.
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
