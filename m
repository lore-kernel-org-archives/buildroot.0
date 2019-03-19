From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Mar 2019 20:20:47 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/efl: Fix build with mesa
In-Reply-To: <20190306231429.22849-1-vadim4j@gmail.com> (Vadim Kochan's
 message of "Thu, 7 Mar 2019 01:14:29 +0200")
References: <20190306231429.22849-1-vadim4j@gmail.com>
Message-ID: <87ef72hdrk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vadim" == Vadim Kochan <vadim4j@gmail.com> writes:

 > efl does not compile with mesa without OpenGL ES because it checks for
 > GL_ES_VERSION_2_0 and declares own GLintptr and GLsizeiptr types if such
 > version is not defined, but mesa declares them too for OpenGL version
 > 1.5, so fix it by add check also for OpenGL 1.5 where these types are
 > defined.

 > Use patch from:
 > 	https://git.enlightenment.org/core/efl.git/commit/?id=0d2b624f1e24240a1c4e651aa1cfe9a8dd10a573

 > Fixes:
 > 	http://autobuild.buildroot.net/results/62ca120f1e54e8c3ae445f98b2624b526569f007

 > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
 > ---

 > v2:
 >     1) Add signed-off to efl fix patch

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
