From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 3 Apr 2011 20:07:37 +0200
Subject: [Buildroot] [PATCH 1/3] Create menu entry to select device
	creation method
In-Reply-To: <201104032005.01046.yann.morin.1998@anciens.enib.fr>
References: <cover.1301763205.git.thomas.petazzoni@free-electrons.com>
	<20110403121829.5a46d779@surf>
	<201104032005.01046.yann.morin.1998@anciens.enib.fr>
Message-ID: <201104032007.38040.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 03 April 2011 20:05:00 Yann E. MORIN wrote:
> So, unless I am totally mistaken, if one chooses devtmpfs with
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS, then devtmpfs is not forced
> in the kernel's .config.
> 
> So even if the user asks for a static /dev, he nonetheless gets a devtmpfs.
> So what's the point of having both options in BR?
> 
> The only difference is that, when _STATIC is selected, the user is offered
> a choice to specify a device_table, and not when _DEVTMPFS is selected.
> 
> What I really find confusing is the config prompts do not actually match
> the behavior. If I select 'static', I expect to get static, not dynamic
> (even if only the kernel is involved).

And forget the above, I forgot to delete it when I saw the 'ifneq' stuff.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
