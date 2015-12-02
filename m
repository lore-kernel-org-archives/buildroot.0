From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Dec 2015 22:11:53 +0100
Subject: [Buildroot] [PATCH 9/9] wireshark: add optional sbc support
In-Reply-To: <565F5BCA.4070802@zacarias.com.ar>
References: <1449089301-29762-1-git-send-email-gustavo@zacarias.com.ar>
 <1449089301-29762-9-git-send-email-gustavo@zacarias.com.ar>
 <20151202205636.GR2193@tarshish> <565F5BCA.4070802@zacarias.com.ar>
Message-ID: <20151202211153.GE5773@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-12-02 17:59 -0300, Gustavo Zacarias spake thusly:
> On 02/12/15 17:56, Baruch Siach wrote:
> 
> >Hi Gustavo,
> >
> >On Wed, Dec 02, 2015 at 05:48:21PM -0300, Gustavo Zacarias wrote:
> >>+ifeq ($(BR2_PACKAGE_SBC),y)
> >>+WIRESHARK_CONF_OPTS += --with-sbc=yes
> >>+WIRESHARK_DEPENDENCIES += sbc
> >>+else
> >>+WIRESHARK_CONF_OPTS += --with-sbc=no
> >>+endif
> >
> >Which package is that? I couldn't find BR2_PACKAGE_SBC in current master.
> 
> Hi Baruch.
> http://patchwork.ozlabs.org/patch/545815/
> Already warned Peter about that prereq on IRC.

Then, you could have said so in a post-commit note, so we all know that
this package is pending in the patchwork.

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
