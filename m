From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Sep 2019 11:12:44 +0200
Subject: [Buildroot] [PATCH v2 1/1]
 support/dependencies/dependencies.sh: check for JSON:PP Perl module
In-Reply-To: <20190915225743.88337-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Mon, 16 Sep 2019 01:57:43 +0300")
References: <20190915225743.88337-1-aperez@igalia.com>
Message-ID: <87tv8z775f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/faa23c0e648b916d0fb01adb95948234d6db7a71/

 > The JSON::PP Perl module is used at build time by the webkitgtk
 > and wpewebkit packages.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
 > ---
 >  support/dependencies/dependencies.sh | 4 ++++
 >  1 file changed, 4 insertions(+)

 > ---
 > v1 -> v2:
 > - Intead of making the package depend on host-perl, check for the module
 >   in the dependencies.sh script to avoid making the build slower. The
 >   module has been in core Perl since 2013.

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
