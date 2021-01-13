From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Jan 2021 10:09:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/sdl2: Cherry-pick
 KMSDRM_CreateWindow fix
In-Reply-To: <20210107102540.534088-1-glex.spb@gmail.com> (Gleb Mazovetskiy's
 message of "Thu, 7 Jan 2021 10:25:39 +0000")
References: <20210107102540.534088-1-glex.spb@gmail.com>
Message-ID: <87wnwhgq3r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gleb" == Gleb Mazovetskiy <glex.spb@gmail.com> writes:

 > Fixes crashes on SDL2 when using GLES on some devices with vc4 and mali gpus.
 > Cherry-pick of https://hg.libsdl.org/SDL/rev/fb6395c49ce97ad3f70de2dfd616c715ab0ebc6d

 > Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>

This looks to be included in the 2.0.14 we have recently moved to, so
I've marked this patch as superseeded.

Can you please verify that it works with 2.0.14?

-- 
Bye, Peter Korsgaard
