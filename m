From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Apr 2018 10:58:09 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/tk: new package
In-Reply-To: <1524212941-5792-3-git-send-email-romain.naour@smile.fr>
References: <1524212941-5792-1-git-send-email-romain.naour@smile.fr>
 <1524212941-5792-3-git-send-email-romain.naour@smile.fr>
Message-ID: <20180420105809.0a7d9ff3@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 Apr 2018 10:29:01 +0200, Romain Naour wrote:
> Use the same version as tcl package.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
> tcl and tk should be updated together.

Perhaps it would be useful to add a comment both in tcl.mk and tk.mk
near the VERSION variable, to let people know that when one is updated,
the other should be updated as well. 

To be done as a follow-up patch :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
