From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 May 2013 11:08:24 +0200
Subject: [Buildroot] [PATCH 1/1] Unhide lttng-tools and lttng-modules
In-Reply-To: <1368262741-24215-1-git-send-email-olivier.schonken@gmail.com>
References: <1368262741-24215-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20130511110824.29f73ed6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

On Sat, 11 May 2013 10:59:01 +0200, Olivier Schonken wrote:
> When using lttng-tools for userland tracing with lttng-libust lttng-modules is
> not required, thus a dependency on building lttng-modules and a kernel is
> overkill for lttng-tools.  It also hides it from a user not wanting to build
> a kernel.  A comment has been added to lttng-modules to show a user that
> lttng-modules is dependent on a kernel build.
> 
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Peter, I believe this can go in 2013.05-rc.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
