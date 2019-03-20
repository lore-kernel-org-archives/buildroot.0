From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 20 Mar 2019 10:26:58 +0100
Subject: [Buildroot] [RFC] openssh: add option to allow login as root
In-Reply-To: <CADvTj4q9+uWVE-Yooj7gwVygHca0Y8KiKoHUBtRruf2jzyi8mQ@mail.gmail.com>
References: <20190319114156.10696-1-esben.haabendal@gmail.com>
 <87mulqebah.fsf@dell.be.48ers.dk>
 <f11c03b3-7edd-5c55-7287-61684f2c9a64@mind.be>
 <87imwdexcs.fsf@dell.be.48ers.dk>
 <CADvTj4q9+uWVE-Yooj7gwVygHca0Y8KiKoHUBtRruf2jzyi8mQ@mail.gmail.com>
Message-ID: <20190320092658.GH2702@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2019-03-20 03:05 -0600, James Hilliard spake thusly:
> One reason for using openssh instead of dropbear without a custom
> config would be
> for sftp support.

So we have gesftpserver that can be used with dropbear to provide sftp,
and AFAICS, that works just out of the box.

I don't understand what you mean by "without a custom config".

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
