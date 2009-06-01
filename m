From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 01 Jun 2009 09:22:02 +0200
Subject: [Buildroot] Buildroot 2009.05 released
Message-ID: <874ov04dwl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2009.05 is released - Go download it at:

http://buildroot.uclibc.org/downloads/buildroot-2009.05.tar.gz

or

http://buildroot.uclibc.org/downloads/buildroot-2009.05.tar.bz2

After 3 months of development a new stable Buildroot release is
out. Significant changes are:

- We now build host versions of packages where needed for build time
  dependencies instead of relying on the correct versions being
  available on the build host.
- A bunch of more packages are converted into Makefile.autotools.in
  format, bringing cleanups and fixes various build issues.
- Ancient toolchain / busybox versions have been removed as announced
  in the the 2009.02 release notes.
- Development moved to GIT.

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2009.05

The next release is going to be 2009.08. Expect the first release
candidate in late July and the final release at the end of August.

Thanks to everyone contributing and testing the release candidates!

-- 
Bye, Peter Korsgaard
