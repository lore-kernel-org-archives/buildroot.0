From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Apr 2013 17:52:15 +0200
Subject: [Buildroot] [PATCH 4/7] arc: Add ARC specific kernel headers
In-Reply-To: <1366630651-6857-5-git-send-email-mjonker@synopsys.com>
References: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
 <1366630651-6857-5-git-send-email-mjonker@synopsys.com>
Message-ID: <20130422175215.184b3550@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mischa Jonker,

On Mon, 22 Apr 2013 13:37:28 +0200, Mischa Jonker wrote:
> ARC architecture will be on kernel.org from 3.9 onwards. For now
> we still need to use a out-of-tree kernel tarball.
> 
> Signed-off-by: Mischa Jonker <mjonker@synopsys.com>

We managed to avoid architecture-specific versions of the kernel until
now, but seems like in this case it's unavoidable until 3.9 is
released... which should happen next week. Maybe we could already
replace this by a patch that adds 3.9, currently pointing to 3.9-rc8,
and that we would change once the final 3.9 is out?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
