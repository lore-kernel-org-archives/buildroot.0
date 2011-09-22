From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 22 Sep 2011 21:55:27 +0200
Subject: [Buildroot] [PATCH] barebox: add support for custom version,
	tarball, git and patch dir
In-Reply-To: <201109221920.37170.arnout@mind.be> (Arnout Vandecappelle's
 message of "Thu, 22 Sep 2011 19:20:36 +0200")
References: <1316290988-25108-1-git-send-email-plagnioj@jcrosoft.com>
 <201109221920.37170.arnout@mind.be>
Message-ID: <87d3es1he8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On Saturday 17 September 2011 22:23:08, Jean-Christophe PLAGNIOL-VILLARD 
 Arnout> wrote:
 >> +config BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR
 >> +       string "custom patch dir"
 >> +       help
 >> +         If your board requires custom patches, add the path to the
 >> +         directory containing the patches here. The patches must be
 >> +         named barebox-<version>-<something>.patch.
 >> +
 >> +         Most users may leave this empty

 Arnout>  Do people often use buildroot this way?  I always make a
 Arnout> project-specific branch of the buildroot tree and drop any
 Arnout> patches directly in there.

I need to support a bunch of projects at work, so I keep them all in a
seperate repo (which gets synced with mainline buildroot ever so
often. Bootloader and kernel are likewise in (shared) local repos.

-- 
Bye, Peter Korsgaard
