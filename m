From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 17 Mar 2016 23:17:34 +0100
Subject: [Buildroot] Pushing PJSIP fixes upstream
Message-ID: <56EB2CFE.4040002@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Natanael Copa,

I am a contributor to the Buildroot embedded Linux build system [0].

Buildroot contains recipes to build packages and I recently added one
for PJSIP [1]. The initial recipe did not build with musl, so I took a
patch [2] that you added to Alpine Linux to fix the same problem.

The patch works as expected, thanks! Now it is in Buildroot, except I
split it in two and added some commentary, but I didn't change the code.

Now I would like these changes to be pushed to mainline PJSIP, so
everyone can benefit in the future and Alpine Linux, Buildroot and
probably other projects can drop a patch (BTW, upstreaming fixes is the
policy for Buildroot packages for these reasons).

I would have pushed the patches myself to the PJSIP developers, but the
Copyright Assignment they have does not allow me to do so because I am
not the original author [3].

For the above reasons, I'd like to ask you whether you are the original
author of the patch.

If you are, would you like to either push the patch upstream yourself or
to give me a written permission to do so under the Agreement?

If you aren't, can you point me to whoever you took the patch from, so I
can forward my request up to the original author?

Thanks in advance.

[0] https://buildroot.org/
[1] https://git.buildroot.net/buildroot/tree/package/libpjsip
[2]
http://git.alpinelinux.org/cgit/aports/commit/main/pjproject/musl-fixes.patch?id=f7dd9f9c08bd3bc49ef62ec7a394bd73e89766d2
[3]
http://lists.pjsip.org/pipermail/pjsip_lists.pjsip.org/2016-March/019039.html

-- 
Luca
