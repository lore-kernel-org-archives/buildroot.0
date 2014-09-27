From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Sep 2014 00:18:39 +0200
Subject: [Buildroot] [PATCH 07 of 15] packages: rename FOO_CONF_OPT into
	FOO_CONF_OPTS
In-Reply-To: <0c4d3dbcb36ecaeed371.1411846364@localhost>
References: <patchbomb.1411846357@localhost>
 <0c4d3dbcb36ecaeed371.1411846364@localhost>
Message-ID: <20140927221839.GQ4298@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-09-27 21:32 +0200, Thomas De Schampheleire spake thusly:
> To be consistent with the recent change of FOO_MAKE_OPT into FOO_MAKE_OPTS,
> make the same change for FOO_CONF_OPT.
> 
> Sed command used:
>    find * -type f | xargs sed -i 's#_CONF_OPT\>#&S#g'
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Casual visual inspection, plus:
    git difftool -y -x 'diff -du -I "_CONF_OPTS\?\>"' CSET^..CSET

(Note: stripped entire patch from reply, too big for the list)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
