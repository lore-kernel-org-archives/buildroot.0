From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2011 10:30:06 +0200
Subject: [Buildroot] [PATCH 2 of 3] Allow BR2_PRIMARY_SITE and
 BR2_BACKUP_SITE to be a file:// URL
In-Reply-To: <CAAXf6LXixYABXkp_LP+9kcUSp1cCMfcOKcYqBxMNzcu-dm2N=A@mail.gmail.com>
References: <patchbomb.1300174025@localhost6.localdomain6>
 <0aa192a871d0b6d66c57.1300174027@localhost6.localdomain6>
 <20110720071336.1958f634@skate>
 <CAAXf6LXixYABXkp_LP+9kcUSp1cCMfcOKcYqBxMNzcu-dm2N=A@mail.gmail.com>
Message-ID: <20110725103006.38d4c164@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 24 Jul 2011 13:54:15 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> I don't think that BR2_DL_DIR and BR2_PRIMARY_SITE serve the same
> purpose. The former specifies where packages should be stored, which
> implies write permissions. The latter specifies where packages come
> from, which only implies read permissions. In a project with multiple
> developers, one wouldn't want the central 'DL_DIR' to become cluttered
> with packages from each individual developer's experiments.

Sounds like a good and convincing argumentation. I'll try to look at
integrating the feature.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
