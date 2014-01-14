From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jan 2014 22:23:55 +0100
Subject: [Buildroot] [PATCH 0/2] Fix check for Python modules for
	cross-compilation
Message-ID: <1389734637-8329-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Simon and Peter!

Here are two patches to enhance (fix) the check of Python modules while
cross-compiling.

There is extensive explanations in the commit log of each patch, but it
basically boils down to the fact that we can't check for Python modules
while doing cross-compilation:
  - we can't execute the target Python (obviously) 
  - the host Python may not have the required module(s)

We've stumbled into this issue while building ola with Buildroot:
    http://buildroot.org/

If you prefer a pull-request, I can set up a public repo for you to pull
from.

I'm sending those to you two, since I could not find a contact info for
where to send the patches. If I missed it, please be kind enough to
point me to the correct recipient(s) or mailing list.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
