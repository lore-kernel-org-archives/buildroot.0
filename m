From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 May 2014 18:00:04 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-09
In-Reply-To: <536F8C6E.1050004@mind.be>
References: <20140510063010.4D1F81010DF@stock.ovh.net>
 <536E86B1.4050005@mind.be> <20140511043405.GB4096@tarshish>
 <536F8C6E.1050004@mind.be>
Message-ID: <20140511160004.GD3428@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-05-11 16:42 +0200, Arnout Vandecappelle spake thusly:
>  True. We could add a dependency on BR2_HOSTARCH for that. Except that Kconfig
> doesn't support string comparison AFAIK.

He, yes it does:

    config FOO
        string "foo"

    config BAR
        string "bar"

    config EQ
        default y if FOO = BAR

Now, try to set FOO="whatever" and BAR="whatever" and look at the
resulting .config file. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
