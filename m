From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 23:35:22 +0200
Subject: [Buildroot] [RESEND][PATCH v2 2/3] gcc: configs: rename
 BR2_EXTRA_GCC_CONFIG_OPTIONS
In-Reply-To: <1470681301-6374-2-git-send-email-pgynther@google.com>
References: <1470681301-6374-1-git-send-email-pgynther@google.com>
 <1470681301-6374-2-git-send-email-pgynther@google.com>
Message-ID: <20161025233522.4452eba8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 Aug 2016 11:35:00 -0700, Petri Gynther wrote:
> Rename BR2_EXTRA_GCC_CONFIG_OPTIONS to BR2_GCC_EXTRA_CONFIG_OPTIONS
> to be consistent with BR2_GCC_* and BR2_BINUTILS_EXTRA_CONFIG_OPTIONS.
> 
> Signed-off-by: Petri Gynther <pgynther@google.com>

I've rejected this patch (2/3) and the following one (3/3). Indeed,
those renames are not really necessary, and renaming options causes
unnecessary breakage of existing configurations. So the benefit of the
rename is too small compared to the breakage for users. I know it's
annoying, I would also prefer to have a more consistent option naming,
but some amount of backward compatibility is more important.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
