From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Feb 2013 15:41:15 +0100
Subject: [Buildroot] [PATCH] new package: gnome-keyring
In-Reply-To: <20130224044212.06c85151@skate>
References: <1361473406-5765-1-git-send-email-stefan.froberg@petroprogram.com>
 <201302212305.27963.yann.morin.1998@free.fr> <20130224044212.06c85151@skate>
Message-ID: <201302241541.15534.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 24 February 2013 Thomas Petazzoni wrote:
> On Thu, 21 Feb 2013 23:05:27 +0100, Yann E. MORIN wrote:
> 
> > > +GNOME_KEYRING_INSTALL_STAGING = YES
> > > +GNOME_KEYRING_CONF_ENV = LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
> > 
> > This should point to the host-variant of libgcrypt-config.
> 
> Hu? No, gnome-keyring is being built for the target here, and we
> install the <foo>-config scripts in $(STAGING_DIR), even though they
> are ultimately executed on the host.

Yes, of course, I've completely busted that one. :-(

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
