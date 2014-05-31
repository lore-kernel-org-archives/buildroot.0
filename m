From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 May 2014 22:33:24 +0200
Subject: [Buildroot] [PATCH] graph-depends: refactor with more color
In-Reply-To: <1401564012-23822-1-git-send-email-francois.perrad@gadz.org>
References: <1401564012-23822-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140531203324.GE3522@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Farn?ois, All,

On 2014-05-31 21:20 +0200, Francois Perrad spake thusly:
> target and host packages don't use the same background color
> +            color = 'gainsboro'
> +        else:
> +            color = 'grey'

The difference between 'gainsboro' and 'grey' is very light. At first, I
thought I had forgotten to apply your patch, so the difference is light.

Did you choose it on-purpose? Did you choose it because it really looks
different when printed?

I'd like we get colours that are visually different, both on-display and
printed. I'll try to find a better default that is more visually
different, and add a new option to specify alternate colours.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
