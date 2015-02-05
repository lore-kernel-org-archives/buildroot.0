From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Feb 2015 16:58:52 +0100
Subject: [Buildroot] [PATCH v2] libvips: requires C++ support
In-Reply-To: <1423148816-9029-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Thu, 5 Feb 2015 15:06:56 +0000")
References: <1423148816-9029-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87h9v09woz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > libvips requires C++ support, otherwise it will fail with an error
 > message like this one:

 > error: ../libvips/.libs/libvips.so: No such file or directory

 > The '--disable-cxx' configure option seems to be broken, so in the
 > meantime a compiler with C++ support is required in order to build
 > libvips successfully.

 > Reported upstream:

 >   https://github.com/jcupitt/libvips/issues/231

 > Fixes:

 >   http://autobuild.buildroot.net/results/cdc7cf5d3501f80c74b70aa09f93b2ad4e2f8602/
 >   http://autobuild.buildroot.net/results/39173dbcbbd0a243900ea583cec024b51f8b803a/
 >   http://autobuild.buildroot.net/results/6794705195bcdb636a8e6582ef5a1e153d4d66b3/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks - And thanks for reporting it upstream!

-- 
Bye, Peter Korsgaard
