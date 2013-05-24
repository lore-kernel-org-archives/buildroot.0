From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 May 2013 19:43:20 +0200
Subject: [Buildroot] buildroot needs a root pasword, why ??
In-Reply-To: <2F3FBE81FE784B19BA37A3BE62C1FA7A@M58p>
References: <2F3FBE81FE784B19BA37A3BE62C1FA7A@M58p>
Message-ID: <20130524174319.GA3205@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sabri, All,

On 2013-05-24 19:36 +0200, Sabri Altunbas spake thusly:
> i installed buildroot-2013.02.tar.bz2 with sourcery codebench. I have not
> actually defined pass word. Regardless a password is required. Can some body
> give me some hints.

The default password is empty, just press ENTER at the password prompt.
That works on the console, maybe not if you try to log in via ssh.

If you try to log in via ssh, check your sshd settings to allow logins
with empty-password.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
