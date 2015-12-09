From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Dec 2015 22:53:42 +0100
Subject: [Buildroot] [PATCH v2 0/4] Handle generated kconfig defconfigs
In-Reply-To: <cover.1441166076.git.sam.bobroff@au1.ibm.com>
References: <cover.1441166076.git.sam.bobroff@au1.ibm.com>
Message-ID: <20151209215342.GB3743@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sam, All,

On 2015-09-02 13:54 +1000, Sam Bobroff spake thusly:
[--SNIP--]
> Sam Bobroff (4):
>   Handle kconfig generated defconfigs
>   package/linux: Handle generated defconfigs
>   boot/at91bootstrap3: Handled generated defconfigs
>   boot/barebox: Handle generated defconfigs

We've discussed this series of yours a while ago on IRC, and we decided
I would adopt it to clean it and respin it. I've now done that, and just
resent an updated version of your patches:

    https://patchwork.ozlabs.org/patch/554822/
    https://patchwork.ozlabs.org/patch/554823/
    https://patchwork.ozlabs.org/patch/554824/
    https://patchwork.ozlabs.org/patch/554825/
    https://patchwork.ozlabs.org/patch/554826/

Of course, those patches are still attributed to you as the author.
You ar ewelcome to review them and give your opinion and this new
iteration.

Thank you very much for your initial submission! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
