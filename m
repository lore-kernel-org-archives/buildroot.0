From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Jan 2019 14:27:53 +0100
Subject: [Buildroot] [git commit] package/meson: fix CPU familly
In-Reply-To: <20181228104954.662A981240@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Fri, 28 Dec 2018 11:52:58 +0100")
References: <20181228104954.662A981240@busybox.osuosl.org>
Message-ID: <87lg3i3xk6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=f3bacda0c0e0adb2ac7f515476f6bb83d1385130
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > As explained in [0], meson recognises a certain set of CPU famillies,
 > whose names slightly differ from those we know them as.

 > If we don't pass the proper cpu_familly, meson whines:
 >     WARNING: Unknown CPU family 'i686', please report this at [...]

 > Subsequently, packages that use that to decide on what they should build
 > and how they should build it, fail to build. That is the case for the
 > upcoming systemd-boot, for example.

 > Fix that by using the list propvided by the meson documentation [0].

 > [0] https://mesonbuild.com/Reference-tables.html#cpu-families

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 > [yann.morin.1998 at free.fr:
 >   - split in its own patch
 >   - imnprove commit log
 > ]
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
