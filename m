From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Dec 2019 22:47:50 +0100
Subject: [Buildroot] [git commit] package/{pkg-generic, python,
 python3}: rename .py file exclusion variable to not conflict
In-Reply-To: <20191201205436.41B687FB5D@busybox.osuosl.org> (Peter Korsgaard's
 message of "Sun, 1 Dec 2019 21:55:37 +0100")
References: <20191201205436.41B687FB5D@busybox.osuosl.org>
Message-ID: <877e3aphq1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=0f5ac40374c91e44af8c3806e848f8e62c42b140
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes:
 > http://autobuild.buildroot.net/results/3b6/3b6280b0b7a9634b747db2865b21c6266007c725/

 > The PYTHON_KEEP_PY_FILES global variable conflicts with the per-package
 > <pkg>_KEEP_PY_FILES variable for the python package, causing make to
 > complain:

 > package/zlib/zlib.mk:7: *** Recursive variable 'PYTHON_KEEP_PY_FILES' references itself (eventually).  Stop.

 > As a workaround, rename the global variable to KEEP_PYTHON_PY_FILES so it
 > cannot conflict with the per-package variable.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
