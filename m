From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Sep 2017 15:24:29 +0200
Subject: [Buildroot] [pull request] arch/arm: add some new armv8a cores
In-Reply-To: <cover.1504444617.git.yann.morin.1998@free.fr>
References: <cover.1504432422.git.yann.morin.1998@free.fr>
 <cover.1504444617.git.yann.morin.1998@free.fr>
Message-ID: <20170903132429.GB2786@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2017-09-03 15:17 +0200, Yann E. MORIN spake thusly:
> PS. I've sent this series as a real pull-request, just to see how
> the new patchwork handles it: currently, series are sorted by the
> first patch, and patchwork misses the cover-letter. Let's see if
> a cover-letter that is a pull-request gets noticed.

Definitely not working, and even breaks the series-detection of
patchowrk:

  - it does not classifies the first patch in the series as being
    part of the series;

  - it treats the cover-letter as bieing on its own, totally
    decorelated from the rest of the series.

Too bad...

Sorry for the noise... :-(

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
