From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 20:57:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/localedef: don't use
 config.site when cross-compiling
In-Reply-To: <53F0E797.3090706@openwide.fr>
References: <1407963923-27432-1-git-send-email-romain.naour@openwide.fr>
 <20140815222816.0bb9e6d8@free-electrons.com>
 <53F0E797.3090706@openwide.fr>
Message-ID: <20140817205712.4bb27241@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun, 17 Aug 2014 19:34:15 +0200, Romain Naour wrote:

> I noticed that other autotools packages continue to load the config.site file
> from host.
> 
> "configure: loading site script /usr/share/config.site"
> 
> I don't know if other packets may be impacted by this issue ...
> 
> Maybe move CONFIG_SITE=no to pkg-autotools.mk ?

Yes, maybe we should do that.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
