From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Feb 2013 09:18:37 +0100
Subject: [Buildroot] [PATCH 1/1] libtirpc: requires toolchain with
 threads support
In-Reply-To: <1360448834-21507-1-git-send-email-gilles.talis@gmail.com>
References: <y>
	<1360448834-21507-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <20130211091837.6fd77a1c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gilles Talis,

On Sat,  9 Feb 2013 14:27:14 -0800, Gilles Talis wrote:
> Fixes:
> http://autobuild.buildroot.org/results/8ba720f47f74df94b8c70ac4befd47c47ce65f2f
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

I believe libtirpc pthread usage could be made optional, and that would
probably be an useful contribution upstream, and avoid us from having
to add this toolchain dependency.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
