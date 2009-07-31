From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jul 2009 15:32:56 +0200
Subject: [Buildroot] [PATCH 1/3] Fix PROGRAM_INVOCATION handling with
 external toolchains
In-Reply-To: <87ab2lugi1.fsf@macbook.be.48ers.dk>
References: <cover.1249045362.git.thomas.petazzoni@free-electrons.com>
	<cover.1249045362.git.thomas.petazzoni@free-electrons.com>
	<8d880c3e5c68bea752c2a075d0ef0c64805df93f.1249045362.git.thomas.petazzoni@free-electrons.com>
	<87ab2lugi1.fsf@macbook.be.48ers.dk>
Message-ID: <20090731153256.28e22167@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 31 Jul 2009 15:30:30 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Thanks. We should probably also update the defconfigs that sets this -
> I'll do that.

Yes, I've seen them with 'git grep', but I don't know what's the
procedure to update them. Just a quick sed pass ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
