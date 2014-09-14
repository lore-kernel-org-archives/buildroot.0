From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Sep 2014 16:48:55 +0200
Subject: [Buildroot] [PATCH 14 of 20] packages: rename FOO_CONF_OPT into
	FOO_CONF_OPTS
In-Reply-To: <f3169fb7c3a584f6a94f.1406668361@localhost>
References: <patchbomb.1406668347@localhost>
 <f3169fb7c3a584f6a94f.1406668361@localhost>
Message-ID: <20140914144855.GM3917@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-29 23:12 +0200, Thomas De Schampheleire spake thusly:
> To be consistent with the recent change of FOO_MAKE_OPT into FOO_MAKE_OPTS,
> make the same change for FOO_CONF_OPT.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
[--SNIP--]

I'm not reviewing that patch, it's too big.

However, if you can provide the way you did the change (sed regexp?) I
can try to reproduce here and see if I get the same results.

I will do so when you respin this series to account for changes (new
packages and changed packaged) since you posted this v1.

Regards,
Yann E. MORIN.

PS. Thomas, sorry for the dupe, I forgot the previous would be held in
    custody due to it being over-size.
YEM.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
