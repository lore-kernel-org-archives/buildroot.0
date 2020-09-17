From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Sep 2020 23:08:22 +0200
Subject: [Buildroot] [PATCH 1/3 v4] package/qt5/qt5webengine: fix
 ffmpeg/codec/alsa option handling for latest
In-Reply-To: <CAOgXH4doM+wTN=vLvZdF-ntyZsO-ht7expa9+8hicZpFQTJUsw@mail.gmail.com>
References: <cover.1600290685.git.yann.morin.1998@free.fr>
 <73c8adc83c7e856136f5eacd8aab44631b0a64cc.1600290685.git.yann.morin.1998@free.fr>
 <20200917145551.3f4a7187@windsurf.hq.k.grp>
 <20200917153910.GG2422@scaer> <20200917191557.595453fe@gmx.net>
 <CAOgXH4doM+wTN=vLvZdF-ntyZsO-ht7expa9+8hicZpFQTJUsw@mail.gmail.com>
Message-ID: <20200917210822.GH2422@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nathan, Peter, All,

On 2020-09-17 15:23 -0400, Nathan Ford spake thusly:
> I can't speak for newer qt5 versions, but for 5.14.2 the -- is
> required. I don't understand the qt build system well enough to
> explain why.

As said on the cover letter, I did not even build-tested it, and just
refreshed the series, and I semi-voluntarily removed the --. I now did a
build, and they are indeed needed.

Thanks for the sharp eyes!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
