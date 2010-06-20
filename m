From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 20 Jun 2010 23:08:27 +0200
Subject: [Buildroot] [PATCH 01/10] New, simpler,
	infrastructure for building the Linux kernel
In-Reply-To: <20100620212219.63498179@surf> (Thomas Petazzoni's message of
	"Sun, 20 Jun 2010 21:22:19 +0200")
References: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<851a84fbbe113196adb69e1a241e18a958cd77c2.1276454802.git.thomas.petazzoni@free-electrons.com>
	<87bpb8b0ld.fsf@macbook.be.48ers.dk> <20100619161327.3748f49c@surf>
	<87hbkyajnf.fsf@macbook.be.48ers.dk> <20100620153508.4e7e2a28@surf>
	<878w69a8ys.fsf@macbook.be.48ers.dk> <20100620212219.63498179@surf>
Message-ID: <87zkyp8l9w.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> On Sun, 20 Jun 2010 19:51:23 +0200
 Thomas> Peter Korsgaard <jacmet@uclibc.org> wrote:

 >> Ok - Notice that there isn't anything stopping people from using a -rc
 >> version (and there shouldn't be) - E.G.
 >> 
 >> http://www.kernel.org/pub/linux/kernel/v2.6/testing/linux-2.6.35-rc3.tar.bz2

 Thomas> Nothing prevents people from doing this, but in that case they have to
 Thomas> use the "Custom tarball" option and give the full URL.

 Thomas> The "Custom version" only works with versions that are available
 Thomas> directly in http://www.kernel.org/pub/linux/kernel/v2.6/.

Ahh yes, sorry about the noise then.

 Thomas> I have separate build and install steps. Would something like the
 Thomas> following be OK for you ?

 Thomas>  * build step
 Thomas> 	make <format>
 Thomas> 	if modules:
 Thomas> 		make modules

 Thomas>  * install step
 Thomas> 	cp .... $(BINARIES_DIR)
 Thomas> 	if modules:
 Thomas> 		make modules_install

Yes, that sounds good.

-- 
Bye, Peter Korsgaard
