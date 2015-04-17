From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Apr 2015 17:17:33 +0200
Subject: [Buildroot] ldconfig error on second make as non-root user
In-Reply-To: <AMSPR03MB051242A6A47EF9A10143A1CCEE40@AMSPR03MB051.eurprd03.prod.outlook.com>
References: <AMSPR03MB051242A6A47EF9A10143A1CCEE40@AMSPR03MB051.eurprd03.prod.outlook.com>
Message-ID: <20150417151733.GB5271@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Al, All,

On 2015-04-16 16:23 +0000, Al West spake thusly:
> I am having an issue with buildroot when running as a regular user.
[--SNIP--]
> /sbin/ldconfig: need absolute file name for configuration file when using -r
> make: *** [target-finalize] Error 1

Can you paste the content of your target/etc/ld.so.conf file (As well as any
file in target/etc/ld.so.conf.d/ ), please?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
