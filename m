From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Nov 2019 08:58:37 +0100
Subject: [Buildroot] [git commit] package/libressl: bump to version 3.0.2
In-Reply-To: <20191107210345.AE0CB8E9EF@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Thu, 7 Nov 2019 22:10:06 +0100")
References: <20191107210345.AE0CB8E9EF@busybox.osuosl.org>
Message-ID: <87zhgtsjiq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=26f42106e8acfd336d8e902da96cd2ac9e63c09d
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > [Thomas: cherry-picked to master as it fixes a build issue with the
 > musl C library:
 >  output/build/libressl-2.9.2/crypto/compat/getprogname_linux.c: In function ??getprogname??:
 >  output/build/libressl-2.9.2/crypto/compat/getprogname_linux.c:32:2: error: #error "Cannot emulate getprogname"
 >  #error "Cannot emulate getprogname"]

Hmm, where do you see that? We also still have 2.9.2 on 2019.08.x and I
don't see any build issues on the autobuilders:

http://autobuild.buildroot.net/?reason=libressl-%

-- 
Bye, Peter Korsgaard
