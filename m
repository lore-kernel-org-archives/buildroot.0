From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Mar 2020 08:39:15 +0100
Subject: [Buildroot] [PATCH 2/3] Makefile: fix package file list if
 FOO_SUBDIR is set
In-Reply-To: <20200318155814.567-2-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Wed, 18 Mar 2020 16:58:12 +0100")
References: <20200318155814.567-1-patrickdepinguin@gmail.com>
 <20200318155814.567-2-patrickdepinguin@gmail.com>
Message-ID: <87v9mpc4ik.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > If a package sets a FOO_SUBDIR (meaning its sources are not under
 > output/build/foo-123 but under output/build/foo-123/$(FOO_SUBDIR)), the
 > .files-list.txt file were also created under FOO_SUBDIR, due to which the
 > logic in the Makefile would not find it.

 > Change the instrumentation steps so that the file list is directly under the
 > package dir, ignoring the subdir.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2020.02.x, thanks.

This is not applicable to the older releases, right?

-- 
Bye, Peter Korsgaard
