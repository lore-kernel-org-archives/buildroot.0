From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Apr 2020 22:23:00 +0200
Subject: [Buildroot] glibc version choice ?
In-Reply-To: <ec2476b1-3bb9-1ea4-fa63-6c5d4908a5d9@gmail.com>
References: <ec2476b1-3bb9-1ea4-fa63-6c5d4908a5d9@gmail.com>
Message-ID: <20200405202300.GO22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-04-05 17:56 +0200, Romain Naour spake thusly:
> So what about reintroducing a version choice for glibc, at least a second choice
> with the version N-1 ?

I am in favour of adding back a version choice for glibc, where we have
a version that points to the a stable release branch, presumably N-1
(but could be N-2 if N-1 is too unstable), which would be the default,
and a version that points to the N branch.

Furthermore, I agree that we should not keep more than two versions.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
