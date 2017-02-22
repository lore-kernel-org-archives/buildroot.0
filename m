From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Feb 2017 18:25:15 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-02-20
In-Reply-To: <20170221072902.457E0206E2@mail.free-electrons.com>
References: <20170221072902.457E0206E2@mail.free-electrons.com>
Message-ID: <20170222172515.GA3569@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-02-21 08:29 +0100, Thomas Petazzoni spake thusly:
> Build failures related to your packages:
> 
>         i686 | freerdp-17834af7bb378f85a3b... | http://autobuild.buildroot.net/results/5d429d0e288754a541ee5d8be515454c5fccd28b

Somehow, there is a /usr/lib32 that sneaked into a -Wl,-rpath option at
some point. I'm trying to find the culprit...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
