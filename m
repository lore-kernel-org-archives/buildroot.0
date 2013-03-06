From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Mar 2013 22:27:45 +0100
Subject: [Buildroot] [PATCH 05/34] package: create virtual package for
 libGLES, libOpenVG and libEGL
In-Reply-To: <874ngo6xqa.fsf@dell.be.48ers.dk>
References: <1362601396-32250-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362601396-32250-6-git-send-email-thomas.petazzoni@free-electrons.com>
 <874ngo6xqa.fsf@dell.be.48ers.dk>
Message-ID: <20130306222745.56cd9033@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 06 Mar 2013 22:10:21 +0100, Peter Korsgaard wrote:

> I personally don't really like the opengl subdir, and I think we need to
> be clear about what we mean when we say opengles (E.G. v1/v2/v3), but we
> can fix that up later.

Yes, I agree with those comments. We can move things out of the opengl/
subdir as an immediate follow-up. As per the version thing, it maybe
can wait until we really have a version problem, no?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
