From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jun 2011 16:18:07 +0200
Subject: [Buildroot] [PATCH] [package/config] Change behaviour of
 symlink .config
In-Reply-To: <1309262850-11224-1-git-send-email-benoit.mauduit@openwide.fr>
References: <1309262850-11224-1-git-send-email-benoit.mauduit@openwide.fr>
Message-ID: <20110628161807.094016bd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 28 Jun 2011 14:07:29 +0200,
Benoit Mauduit <benoit.mauduit@gmail.com> a ?crit :

> This patch change the bahaviour with .config management.
> 
> The default behaviour is modified only if .config is a symbolic link.
> In this case, the target pointed by the link will be overwritten, and
> the old .config is save to .config.old.
> 
> This can be useful when we want to save and use the config file
> outside the Buildroot directory.

I am not sure to understand your use case. Isn't using out-of-tree
builds with O= a better solution, if what you want is to have the
config file outside of the Buildroot source directory ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
