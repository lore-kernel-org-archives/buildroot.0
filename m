From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Apr 2014 23:28:51 +0200
Subject: [Buildroot] Asking a favor
In-Reply-To: <ea83c79e30b1bba43b6fe3de6096e8e7@paravisioner.com>
References: <ea83c79e30b1bba43b6fe3de6096e8e7@paravisioner.com>
Message-ID: <20140413212851.GA6582@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Parsa,

[resend, forgot to Cc the proper buildroot ML]

On 2014-04-14 01:23 +0430, Parsa Panahi spake thusly:
> I have a problem with buildroot configuration file. when I create the .config file and make it, I face an error in the terminal
> that :
> 
> linux/linux.mk:69: *** No kernel device tree source specified, check your BR2_LINUX_KERNEL_USE_INTREE_DTS /
> BR2_LINUX_KERNEL_USE_CUSTOM_DTS settings.  Stop.
> 
> I searched the whole Internet !!! and found nothing useful ! I don't know what causing this problem !! I've commented these
> variables ( BR2_LINUX_KERNEL_USE_INTREE_DTS, BR2_LINUX_KERNEL_USE_CUSTOM_DTS) in the .config file but when I make the new file it
> gives another error for another variable !!
> 
> 
> I don't know how to solve this and whom to seek answer from !!! I

The proper place to look for support on Buildroot is to look on the
Buildroot website:
    http://buildroot.org/
where you'll find a "Support" button that points to:
    http://buildroot.org/support.html

Forwarding your mail to the list now. Maybe someone there will have an
idea.

And please, do not post HTML mails, they are forbidden on the list.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
