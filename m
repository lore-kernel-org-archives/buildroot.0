From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 May 2020 08:50:41 +0200
Subject: [Buildroot] [PATCH] package/qemu: remove csky fork
In-Reply-To: <965CE5FB-BE29-47EA-98AF-ACAB3CCB7B92@c-sky.com> (Guo Ren's
 message of "Sat, 23 May 2020 09:01:32 +0800")
References: <20200522232212.2909156-1-romain.naour@gmail.com>
 <965CE5FB-BE29-47EA-98AF-ACAB3CCB7B92@c-sky.com>
Message-ID: <87o8qfjgam.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Guo" == Guo Ren <ren_guo@c-sky.com> writes:

 > Acked-by: Guo Ren <guoren@kernel.org>
 > The qemu upstreaming is on the way, let?s wait for official version.

But the build is broken today, right? (As we pass --enable-libssh /
--disable-libssh). Do you have any idea about an ETA for mainline c-sky
support or atleast a more modern git repo with c-sky support which
accepts the same configure options as our 4.2 version?

Unless we have something very soon, I think applying this patch for
2020.05 (and 2020.02.x) makes more sense.

What do you say?

-- 
Bye, Peter Korsgaard
