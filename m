From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2011 13:38:08 +0200
Subject: [Buildroot] [PATCH 2 of 5] toolchain-external: allow
 downloading a custom toolchain
In-Reply-To: <CAAXf6LX5Fxme9tHcKVmk92Z2E4cptuGCQ7wyGUZO3PbZQeoZXw@mail.gmail.com>
References: <patchbomb.1316588130@localhost6.localdomain6>
 <d181fc061658f56665ec.1316588132@localhost6.localdomain6>
 <20110921095843.453ca812@skate>
 <CAAXf6LX5Fxme9tHcKVmk92Z2E4cptuGCQ7wyGUZO3PbZQeoZXw@mail.gmail.com>
Message-ID: <20110921133808.4158ef1a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 21 Sep 2011 10:22:16 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> For me it's fine to keep the distinction, but be aware that the
> local/remote naming may be confusing: if a user receives a toolchain
> tarball from e.g. a hardware manufacturer and saves it to his disk, I
> would call it 'local'. But that user would typically like to use the
> 'remote' rules so that he does not need to unpack the toolchain
> himself.
> 
> Maybe we should call it 'custom toolchain tarball' versus 'custom
> unpacked toolchain' or something alike. The tarball can be either
> local (file://something) or remote (http, ftp, scp, ...).

Yes, sounds better.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
