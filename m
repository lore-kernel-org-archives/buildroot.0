From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Feb 2014 22:40:33 +0100
Subject: [Buildroot] [PATCH v2 1/2] packages: improve dependency check
 in virtual packages.
In-Reply-To: <1393343137-4209-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1393343137-4209-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1393343137-4209-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140225214033.GB3567@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On 2014-02-25 16:45 +0100, Eric Le Bihan spake thusly:
> The current version of dependency check for virtual package <foo>
> defines FOO_CONFIGURE_CMDS to print an error message if the
> dependencies are not met.
> 
> This patch updates all the virtual packages to use the GNU Make control
> function $(error text...) instead.
> 
> This makes the error happen at the beginning of the build, with a clearer
> message.

You missed two virtual packages in this change:
  - jpeg
  - cryptodev

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
