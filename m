From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Apr 2013 10:32:26 +0200
Subject: [Buildroot] [PATCH] post-build: reimplement using a for loop
 and make verbose
In-Reply-To: <1364977729-27519-1-git-send-email-luca@lucaceresoli.net>
References: <1364977729-27519-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20130403103226.36c1e0be@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Wed,  3 Apr 2013 10:28:48 +0200, Luca Ceresoli wrote:
> Make the post-build system similar to the rootfs overlay system. This allows to
> show each script filename before execution.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

I don't have a strong opinion on whether this is useful or not, but if
it gets applied, I'd like the same to be done for post-image scripts,
in order to keep the consistency.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
