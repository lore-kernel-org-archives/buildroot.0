From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Mar 2008 17:47:24 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/sdl
In-Reply-To: <16042261.post@talk.nabble.com> (Hebbar's message of "Thu\,
	13 Mar 2008 18\:05\:24 -0700 \(PDT\)")
References: <20080307133125.0D12A1201B3@busybox.net>
	<16042261.post@talk.nabble.com>
Message-ID: <87iqzl1en7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hebbar" == Hebbar  <gururajakr@sanyo.co.in> writes:

 Hebbar> Hi,

 Hebbar> With this commit, sdl header are not copied to
 Hebbar> $(STAGING_DIR)/usr/include folder and sdl_mixer fails to
 Hebbar> build because of missing sdl.h and other sdl related header
 Hebbar> files.

Sorry, my testing didn't catch that as I already had the headers
installed - Should be fixed now.

 Hebbar> I think we need to maintain --includedir option.

I fixed it instead by skipping the exec-prefix stuff and instead
patching sdl-config after install.

-- 
Bye, Peter Korsgaard
