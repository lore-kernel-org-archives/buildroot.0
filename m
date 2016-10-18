From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Oct 2016 15:51:19 +0200
Subject: [Buildroot] [PATCH] qt5base: fix misspelling of "directfb"
In-Reply-To: <20161018134754.lp7vtfqt3j33hp5z@ftbfs.org>
References: <20161018020957.2662-1-kraai@ftbfs.org>
 <20161018114556.238563ea@free-electrons.com>
 <20161018134754.lp7vtfqt3j33hp5z@ftbfs.org>
Message-ID: <20161018155119.06d87f56@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Oct 2016 06:47:54 -0700, Matt Kraai wrote:

> If the comment is removed, then there is no indication that a directfb
> backend is available if directfb is disabled.  That's inconsistent
> with the handling of the other backends, which have the following
> comments if they're not available:
> 
> * X.org XCB backend available if X.org is enabled
> * eglfs backend available if OpenGL and EGL are enabled

Indeed.

> Should I still remove the comment?  Or make the message consistent
> with the other backends (i.e., "directfb backend available if directfb
> is enabled")?

Let's keep the comment, just adjusted.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
