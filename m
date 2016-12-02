From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Dec 2016 09:00:59 +0100
Subject: [Buildroot] [git commit] Merge branch 'next'
In-Reply-To: <CAB0FRsuawkVvNXQeRcyRVfBNh2gMQqKi3b0-T+Bhu35+FkX+dw@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= Perrad"'s message of "Fri, 2 Dec 2016
 00:08:10 +0100")
References: <20161201222141.CB2398026C@busybox.osuosl.org>
 <CAB0FRsuawkVvNXQeRcyRVfBNh2gMQqKi3b0-T+Bhu35+FkX+dw@mail.gmail.com>
Message-ID: <87d1haahfo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fran?ois" == Fran?ois Perrad <francois.perrad@gadz.org> writes:

Hi,

 > With this merge, the following commits are missing :
 > *     xterm: depend on libXinerama if appropriatenext    J?r?me Pouiller
 > *     rpm: switch to version 4.13.0    James Knight
 > *     package/libdvbcsa: fix altivec problems on powerpc64    Sam bobroff
 > *     Revert "jasper: Disable debugging when building for xtensa"
 > Max Filippov
 > *     ncftp: bump version to 3.2.6    Vicente Olivert Riera
 > *     libgtk3: bump version to 3.22.4    Vicente Olivert Riera
 > *     luarocks: bump to version 2.4.2    Francois Perrad
 > *     lua-messagepack: bump to version 0.3.6    Francois Perrad
 > *     lsqlite3: bump to version 0.9.4    Francois Perrad
 > *     lttng-libust: bump version to 2.9.0    Vicente Olivert Riera
 > *     lttng-babeltrace: bump version to 1.5.0    Vicente Olivert Riera
 > *     lttng-modules: bump version to 2.9.0    Vicente Olivert Riera
 > *     lttng-tools: bump version to 2.9.0    Vicente Olivert Riera
 > *     toolchain-external: bump Linaro AArch64 toolchain to 2016.11
 > Romain Naour
 > *     toolchain-external: bump Linaro ARMeb toolchain to 2016.11    Romain Naour
 > *     toolchain-external: bump Linaro ARM toolchain to 2016.11    Romain Naour

Argh, indeed. My local next branch was not uptodate. I've merged the
remaining commits now.

Thanks!

-- 
Bye, Peter Korsgaard
