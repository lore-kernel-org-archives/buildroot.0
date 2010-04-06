From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Apr 2010 08:38:55 +0200
Subject: [Buildroot] [PATCH 1/1] libaio: convert to the GENTARGETS
 infrastructure
In-Reply-To: <87mxxhshfc.fsf@macbook.be.48ers.dk>
References: <cover.1270499953.git.thomas.petazzoni@free-electrons.com>
	<cover.1270499953.git.thomas.petazzoni@free-electrons.com>
	<0254addf9b7aee9429122d5d6934adbe88b904d4.1270499953.git.thomas.petazzoni@free-electrons.com>
	<87mxxhshfc.fsf@macbook.be.48ers.dk>
Message-ID: <20100406083855.3f08c838@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 05 Apr 2010 23:44:39 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> We have BR2_KERNEL_MIRROR, might be good to use.

Right.

> Are you missing a patch? I don't see any DESTDIR handling in the libaio
> build system, and I get:

Damn, forgot to git add the two patches I borrowed from OpenEmbedded.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
