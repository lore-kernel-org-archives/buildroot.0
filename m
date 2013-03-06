From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Mar 2013 22:37:08 +0100
Subject: [Buildroot] [PATCH 05/34] package: create virtual package for
	libGLES, libOpenVG and libEGL
In-Reply-To: <20130306222745.56cd9033@skate> (Thomas Petazzoni's message of
 "Wed, 6 Mar 2013 22:27:45 +0100")
References: <1362601396-32250-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362601396-32250-6-git-send-email-thomas.petazzoni@free-electrons.com>
 <874ngo6xqa.fsf@dell.be.48ers.dk> <20130306222745.56cd9033@skate>
Message-ID: <87vc945hx7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear Peter Korsgaard,
 Thomas> On Wed, 06 Mar 2013 22:10:21 +0100, Peter Korsgaard wrote:

 >> I personally don't really like the opengl subdir, and I think we need to
 >> be clear about what we mean when we say opengles (E.G. v1/v2/v3), but we
 >> can fix that up later.

 Thomas> Yes, I agree with those comments. We can move things out of the
 Thomas> opengl/ subdir as an immediate follow-up. As per the version
 Thomas> thing, it maybe can wait until we really have a version
 Thomas> problem, no?

Well, yes - But I would like to not rename symbols once they have been
in a release unless we really have to, so I would prefer to think about
the version issue sooner rather than later.

-- 
Bye, Peter Korsgaard
