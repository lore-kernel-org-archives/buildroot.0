From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 19 Mar 2013 23:12:12 +0100
Subject: [Buildroot] [PATCH v3] rework patch model
In-Reply-To: <1363598027-25900-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Mon, 18 Mar 2013 09:13:47 +0000")
References: <1363598027-25900-1-git-send-email-spdawson@gmail.com>
Message-ID: <87d2uvrqdf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "s" == spdawson  <spdawson@gmail.com> writes:

 s> From: Simon Dawson <spdawson@gmail.com>
 s> At the Buildroot Developers Meeting (4-5 February 2013, in Brussels)
 s> a change to the patch logic was discussed. See

 s> http://elinux.org/Buildroot:DeveloperDaysFOSDEM2013

 s> for details. In summary:

 s> * For patches stored in the package directory, if
 s>   package/<pkg>/<version>/ does exist, apply package/<pkg>/<version>/*.patch,
 s>   otherwise, apply package/<pkg>/*.patch
 s> * For patches stored in the global patches directory, if
 s>   $(GLOBAL_PATCH_DIR)/<pkg>/<version>/ does exist, apply
 s>   $(GLOBAL_PATCH_DIR)/<pkg>/<version>/*.patch, otherwise, apply
 s>   $(GLOBAL_PATCH_DIR)/<pkg>/*.patch

 s> This patch adds the new BR2_GLOBAL_PATCH_DIR configuration item, and reworks
 s> the generic package infrastructure to implement the new patch logic.

Committed with the minor doc nits pointed out by Thomas fixed, thanks!

-- 
Bye, Peter Korsgaard
