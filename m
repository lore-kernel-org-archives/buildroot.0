From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 17:33:31 +0100
Subject: [Buildroot] [PATCH v6 1/2] Support for multiple
 BR2_GLOBAL_PATCH_DIR
In-Reply-To: <1387362302-12198-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1387362302-12198-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <20131225173331.61f2d0f0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Wed, 18 Dec 2013 04:25:01 -0600, Ryan Barnett wrote:
> Adding support for specifying multiple directories in
> BR2_GLOBAL_PATCH_DIR. This will allow for a layered approach for the
> patching of a package.
> 
> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Reviewed-by: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Both patches applied, thanks. On the second patch, I did the fix for
the minor typo noticed by Thomas DS.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
