From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Feb 2015 21:39:13 +0100
Subject: [Buildroot] [PATCH] qt5multimedia: Make it compile with
	no-opengl
In-Reply-To: <1423411498-12674-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Sun, 8 Feb 2015 16:04:58 +0000")
References: <1423411498-12674-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87h9uw5ea6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Backport an upstream patch to make it compile with no-opengl. Otherwise
 > it will fail showing an error message like this one:

 > qpaintervideosurface.cpp:99:47: error: 'QOpenGLContext' has not been
 > declared

 > Upstream commit:

 >   https://qt.gitorious.org/qt/qtmultimedia/commit/2b181d546970d18a48a0f36f5d1a22418b61cd4d

 > Fixes:

 >   http://autobuild.buildroot.net/results/b77/b77cdf9b1cf6cafd5afef7337553bb32489207e5/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
