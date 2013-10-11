From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 11 Oct 2013 13:50:08 +0200
Subject: [Buildroot] [git commit] toolchain-external: update Linaro ARM
	toolchain
In-Reply-To: <CAAXf6LVKr0DPT1U2GuTqdSGAyMGEAdDGF6Uo0PYeb4gGLmg9wQ@mail.gmail.com>
 (Thomas De Schampheleire's message of "Fri, 11 Oct 2013 13:40:40
 +0200")
References: <20131009143431.9A85B9B970@busybox.osuosl.org>
 <52564EFD.10506@mind.be> <20131010095744.5690a242@skate>
 <5257BE84.5020901@lucaceresoli.net>
 <CAAXf6LXMvV4rrxbcAozT69PsEVp2CgpgDNhZXnQ6ytdWZz+SvA@mail.gmail.com>
 <20131011112938.16a751d7@skate> <878uy0un36.fsf@dell.be.48ers.dk>
 <20131011122355.791e8810@skate>
 <CAAXf6LVKr0DPT1U2GuTqdSGAyMGEAdDGF6Uo0PYeb4gGLmg9wQ@mail.gmail.com>
Message-ID: <874n8ouivj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 Thomas> Looking at the linaro download page and the names of the tarballs,
 Thomas> they do co-name their toolchains with the gcc version, at least since
 Thomas> 2013.

 Thomas> gcc-linaro-armeb-linux-gnueabihf-4.8-2013.09_linux.tar.xz
 Thomas> gcc-linaro-arm-linux-gnueabihf-4.7-2013.04-20130415_linux.tar.xz

 Thomas> So, naming the config options like that may not be such a wild
 Thomas> idea after all.

Indeed.

 Thomas> Of course, we still have to decide whether we want gcc 4.8, 4.7, and
 Thomas> 4.6, or rather larger jumps like
 Thomas> gcc 4.8, 4.4, 4.0 or something like that.

As we support each individual 4.x version between 4.3 and 4.8 for the
internal toolchain (+/- odd architectures) and Linaro is pretty leading
edge, I would say 4.6 -> 4.8.

-- 
Bye, Peter Korsgaard
