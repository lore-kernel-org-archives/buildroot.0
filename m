From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Nov 2014 14:40:55 +0100
Subject: [Buildroot] [PATCH 0/4] nfs-utils: fix static build (branch
	yem/for-release)
In-Reply-To: <cover.1416748649.git.yann.morin.1998@free.fr>
References: <cover.1416748649.git.yann.morin.1998@free.fr>
Message-ID: <20141123134055.GB4151@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2014-11-23 14:19 +0100, Yann E. MORIN spake thusly:
> This small series fixes nfs-utils for static builds.

I forgot to say:

  - I'm going to send the libtirpc upstream. That one is pretty trivial,
    so I do not expect much reluctance from upstream to apply it;

  - we're carrying nfs-utlis 1.2.6, while 1.3.1 has been out recently;
    1.3.1 is not yet fixed anyway;

  - I'll send the nfs-utils patch upstream. On that one, I expect it
    might take some efforts to get it appplied; it might at least have
    to go through some iterations and so we might have a patch that is
    not exactly what upstream ends up applying, in which case I'll fix
    when we update to an nfs-utils that has been fixed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
