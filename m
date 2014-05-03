From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 May 2014 21:48:48 +0200
Subject: [Buildroot] [PATCH 07/12] package/upx: new package
In-Reply-To: <f0cb87087b13947a80acf27fe6c2dbec3c0430a1.1399050467.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Fri, 2 May 2014 19:10:33 +0200")
References: <cover.1399050467.git.yann.morin.1998@free.fr>
 <f0cb87087b13947a80acf27fe6c2dbec3c0430a1.1399050467.git.yann.morin.1998@free.fr>
Message-ID: <87oazemyn3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Frank Hunleth <fhunleth@troodon-software.com>
 > UPX is a free, portable, extendable, high-performance executable
 > packer for several executable formats.

 > This is needed for syslinux 6.x.

 > Note: upx is a host-only package. Although it supports quite a few
 > target architectures, the only use so far will be for use by syslinux,
 > which already has an x86-on-x86 requirement anyway. So we currently do
 > not care to have target-dependencies on host-upx.

 > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
 > [yann.morin.1998 at free.fr: builds fine in parallel; fix build to
 >  locate libucl; fix installation; don't add a menuconfig entry]
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Tested-by: Romain Naour <romain.naour@openwide.fr>

 > ---
 > Changes v1 -> v2:
 >   - slightly improve on the commit log about host <-> target
 >     architectutre limitations  (Arnout)

Committed, thanks.

-- 
Bye, Peter Korsgaard
