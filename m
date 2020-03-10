From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 23:17:14 +0100
Subject: [Buildroot] [git commit] package/libftdi1: fix python support
In-Reply-To: <20200207144412.D94648D4D0@busybox.osuosl.org> (Peter Korsgaard's
 message of "Fri, 7 Feb 2020 15:54:02 +0100")
References: <20200207144412.D94648D4D0@busybox.osuosl.org>
Message-ID: <87r1xzn9cl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=df734533cfeab86951436b6d0e19e8294e271b35
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Add an upstreamed patch that reorders find_package() commands.
 > This way Python interpreter will be detected first and based on
 > it the Python libraries can be found.

 > Fixes the following CMake error:

 > Could NOT find PythonLibs (missing: PYTHON_LIBRARIES PYTHON_INCLUDE_DIRS)

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
