From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 Jun 2014 13:52:38 +0200
Subject: [Buildroot] [PATCH] svgtiny: create BUILDDIR before
	$(BUILDDIR)/src_colors.c
In-Reply-To: <1403074632-28224-1-git-send-email-jcmvbkbc@gmail.com> (Max
 Filippov's message of "Wed, 18 Jun 2014 10:57:12 +0400")
References: <1403074632-28224-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <87tx7i77uh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > Fixes:
 >   http://autobuild.buildroot.net/results/5fe/5feca450d70a8de48fa2463e55c9e84db5d755b0/

 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
 > ---
 >  .../libsvgtiny-100-create-builddir.patch           |   15 +++++++++++++++
 >  1 files changed, 15 insertions(+), 0 deletions(-)
 >  create mode 100644 package/libsvgtiny/libsvgtiny-100-create-builddir.patch

 > diff --git a/package/libsvgtiny/libsvgtiny-100-create-builddir.patch b/package/libsvgtiny/libsvgtiny-100-create-builddir.patch
 > new file mode 100644
 > index 0000000..a404d86
 > --- /dev/null
 > +++ b/package/libsvgtiny/libsvgtiny-100-create-builddir.patch

We should also add an "order" number to the existing patch and call this
-02-create-builddir.patch. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
