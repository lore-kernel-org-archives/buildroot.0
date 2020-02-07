From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 07 Feb 2020 10:13:37 +0100
Subject: [Buildroot] [PATCH] package/libftdi1: fix python support
In-Reply-To: <20200206095421.12987-1-yegorslists@googlemail.com>
 (yegorslists's message of "Thu, 6 Feb 2020 10:54:21 +0100")
References: <20200206095421.12987-1-yegorslists@googlemail.com>
Message-ID: <87imkiyd32.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > Add an upstreamed patch that reorders find_package() commands.
 > This way Python interpreter will be detected first and based on
 > it the Python libraries can be found.

 > Fixes the following CMake error:

 > Could NOT find PythonLibs (missing: PYTHON_LIBRARIES PYTHON_INCLUDE_DIRS)

We don't seem to have any autobuilder failures in libftdi1 for almost 1
year. Any idea why this doesn't trigger on the autobuilders?

-- 
Bye, Peter Korsgaard
