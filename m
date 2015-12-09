From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Dec 2015 22:51:08 +0100
Subject: [Buildroot] [git commit] edid-decode: new package
In-Reply-To: <56682A57.4090207@imgtec.com> (Vicente Olivert Riera's message of
 "Wed, 9 Dec 2015 13:19:19 +0000")
References: <20151209131631.4526981DA0@busybox.osuosl.org>
 <56682A57.4090207@imgtec.com>
Message-ID: <87k2onl29f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Hello Peter,
 > $(TARGET_MAKE_ENV) should have been used before $(MAKE), as I said in my
 > review for this patch:

 > http://patchwork.ozlabs.org/patch/553537/

Strange, I didn't see your mail when I applied the patch - My mail has
been acting up a bit.

TARGET_MAKE_ENV doesn't really matter here as it doesn't call anything
else than $CC / mkdir / install, but I'll add it for consistency and in
case future versions do.

Thanks for the review!

-- 
Venlig hilsen,
Peter Korsgaard 
