From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Oct 2009 22:30:32 +0200
Subject: [Buildroot] [PATCH 2/6] always append FPU_SUFFIX
In-Reply-To: <87iqes2wye.fsf@macbook.be.48ers.dk>
References: <cover.1254853146.git.rep.dot.nop@gmail.com>
	<1a6b4f990a536bfd23ae1e57a2cd11527761f8ec.1254853146.git.rep.dot.nop@gmail.com>
	<cover.1254853146.git.rep.dot.nop@gmail.com>
	<4a5a0f10dbaecfd7b024c0cf1e90fd68a6730eac.1254853146.git.rep.dot.nop@gmail.com>
	<87iqes2wye.fsf@macbook.be.48ers.dk>
Message-ID: <20091006223032.27732b8c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 06 Oct 2009 20:34:17 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Shouldn't we rather get rid of that suffix completely?

Agreed. If you want several toolchains for different arch, FPU or
whatever, use O=.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
