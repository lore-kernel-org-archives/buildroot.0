From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Dec 2013 20:19:18 +0100
Subject: [Buildroot] [PATCH 03/16] packages: convert Github http://
 users to	the github helper
In-Reply-To: <768537dc-810e-4cbf-9385-69f4d9ea05b4@email.android.com>
References: <1386264059-14057-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386264059-14057-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <768537dc-810e-4cbf-9385-69f4d9ea05b4@email.android.com>
Message-ID: <20131205201918.77052a05@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 05 Dec 2013 20:14:56 +0100, Thomas De Schampheleire wrote:

> Thomas, did you see my comments on Mischa's v3 earlier today?

Hu, did you really read this new patch series? I've split the patch into
3 patches as you requested, and I've moved the macro to
pkg-download.mk, as you requested.

>  Do you plan to make these changes, do you expect Mischa or someone else to do them? 

See above.

> Do you consider it more to be a follow-up patch?

See the cover letter for the patch series:

"""
According to Thomas DS comment, I've split Mischa's patch adding the
github helper into three patches: one adding the helper, one adding
the documentation, one converting a bunch of packages to the new
helper. Note that not all packages are converted, but this can be done
through followup commits: we really want this ARC and Microblaze stuff
to get merged now.
"""

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
