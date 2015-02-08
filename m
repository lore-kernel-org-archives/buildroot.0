From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Feb 2015 22:25:57 +0100
Subject: [Buildroot] [PATCH 1/1] webkit : fix single line comments
In-Reply-To: <DCBE421ABABD4C348438B77A8C49F446@JohanW7>
References: <1423402220-10090-1-git-send-email-sagaert.johan@skynet.be>
 <20150208155730.2a1b569e@free-electrons.com>
 <D347304386AE432996658D49AB648DAE@JohanW7>
 <20150208181051.51ff61b7@free-electrons.com>
 <DCBE421ABABD4C348438B77A8C49F446@JohanW7>
Message-ID: <20150208212557.GA19461@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sagaert, All,

On 2015-02-08 21:56 +0100, Sagaert Johan spake thusly:
> Here is the output with make V=1
[--SNIP--]
> [...]/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc [...] -ansi [...]

Hmmm. That might be due to -ansi being passed on the command line...

And I just tried it here: that indeed the culprit.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
