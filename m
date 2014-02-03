From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2014 21:16:13 +0100
Subject: [Buildroot] [V2 1/2] luarocks: never wraps script
In-Reply-To: <1391425657-30915-1-git-send-email-francois.perrad@gadz.org>
References: <1391425657-30915-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140203201613.GA3264@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Franc?ois, All,

On 2014-02-03 12:07 +0100, Francois Perrad spake thusly:
> the wrapper introduces some HOST_DIR paths on target

Can you explain a bit more in details what this wrapper is, and why we
do not want it (besides the fact it uses HOST_DIR paths on the target)?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
