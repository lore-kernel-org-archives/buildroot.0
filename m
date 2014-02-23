From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 23 Feb 2014 20:56:00 +0100
Subject: [Buildroot] [PATCH 1/1] ti-gfx: bump to version 5_01_00_01
In-Reply-To: <20140223193116.GI32759@free.fr> (Yann E. MORIN's message of
 "Sun, 23 Feb 2014 20:31:16 +0100")
References: <52fd38fd.870eec0a.7f7f.13a5@mx.google.com>
 <20140223193116.GI32759@free.fr>
Message-ID: <87mwhhob73.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Marcelo, All,
 > On 2014-02-13 18:38 +0000, kuyurix at gmail.com spake thusly:
 >> From: Marcelo Gutierrez <kuyurix@gmail.com>
 >> 
 >> Signed-off-by: Marcelo Gutierrez <kuyurix@gmail.com>

 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > Notes:

 >   - The version pointed to by Spencer was 5.00.x, and was a beta
 >     version, and only contained the hardfp variant. The version in
 >     this patch is 5.01.x, is not marked as beta, and contains both
 >     the hardfp and softfp variants.

 >   - With 4.10.x and before, the *_$(TI_GFX_VERSION).bin archive would
 >     contain a huge load of stuff we did not need, and was roughly
 >     1.7GiB big. But with 5.01.x, this file is now back to a more
 >     acceptable size, roughly 140MiB (although it still contains way
 >     much more than we need).

Sounds good. Committed to next, thanks both.

-- 
Bye, Peter Korsgaard
