From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 22 May 2014 22:02:26 +0200
Subject: [Buildroot] How to use the TZ selection ?
In-Reply-To: <637714E3940F4DD484ECB3AC585815CF@JohanW7>
References: <F979DDABBA2E48ADB211714423219F77@JohanW7>
 <20140522192245.GA9460@free.fr>
 <637714E3940F4DD484ECB3AC585815CF@JohanW7>
Message-ID: <20140522200226.GB9460@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sagaert, All,

[please, do *not* top-post, but do reply in-lined]

On 2014-05-22 21:52 +0200, Sagaert Johan spake thusly:
> I had entered BR2_TARGET_LOCALTIME="Europe" ,

Indeed, this is not a valide timezone location.

> It did not resolve "Europe" and maybe that's why it created a symlink
> to a directory instead. Perhaps it might be better to yield a build
> error in case the timezone could not be found.

Indeed, that's a good idea, I'll do that in a moment...
Thanks for the report! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
