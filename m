From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2020 14:54:07 +0100
Subject: [Buildroot] [PATCH 00/32] add a huge bunch of license file
 hashes
In-Reply-To: <20200202194321.16321-1-heiko.thiery@gmail.com>
References: <20200202194321.16321-1-heiko.thiery@gmail.com>
Message-ID: <20200203135407.GC3299@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2020-02-02 20:42 +0100, Heiko Thiery spake thusly:
> This series add missing entries in the hash files for the license files.
> The entries are generated semi-automatically and manually recheck.

Thank you very much for this! :-)

I've now applied the whole series, and it dd pass muster, except for
those few exceptions:

  - dropped because of conflicts:
    - kodi-audioencoder-vorbis
    - kodi-screensaver-matrixtrails
    - kodi-screensaver-biogenesis
    - kodi-screensaver-pyro
    - mii-diag

  - dropped because already handled:
    - rt-test

  - fixed:
    - libplist
    - weston

  - new not covered:
    - weston-imx

Can you have a look at those, please?

Thanks again! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
