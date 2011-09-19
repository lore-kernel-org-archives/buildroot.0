From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 08:44:01 +0200
Subject: [Buildroot] [PATCH 1/1] external toolchain: slightly optimize
 the copy of the toolchain sysroot
In-Reply-To: <CAPNngRNmyeCyFB_siN77pjAJwhuLWgYXuS-znGO8RQ9RORW3pg@mail.gmail.com>
References: <cover.1314826575.git.thomas.petazzoni@free-electrons.com>
 <bf913e756e822eac217406309f3e423ca5dca580.1314826575.git.thomas.petazzoni@free-electrons.com>
 <CAPNngRNmyeCyFB_siN77pjAJwhuLWgYXuS-znGO8RQ9RORW3pg@mail.gmail.com>
Message-ID: <20110919084401.3da42c86@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 18 Sep 2011 23:46:05 -0400,
Milton Soares Filho <milton.soares.filho@gmail.com> a ?crit :

> I've been doing a similar thing to avoid copying unneeded stuff from a
> "non-pure" toolchain (STLinux toolchain), but by using a blacklist
> file and rsync's --exclude-from option.
> 
> Would it be interesting to anyone else (besides me) to have this
> generic approach? It'd be a simple addition to this patch.

I am at least interested in seeing what you have done, to see what
could be integrated in Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
