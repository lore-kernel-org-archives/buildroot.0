From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Feb 2013 10:33:19 +0100
Subject: [Buildroot] [PATCH v3 2/5] Add python3 config directory simlink
In-Reply-To: <1360747237-30048-3-git-send-email-kpa_info@yahoo.fr>
References: <1360747237-30048-1-git-send-email-kpa_info@yahoo.fr>
 <1360747237-30048-3-git-send-email-kpa_info@yahoo.fr>
Message-ID: <20130213103319.678c7948@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Patrick Gerber,

On Wed, 13 Feb 2013 10:20:34 +0100, Patrick Gerber wrote:
> Add a simlink to alias the python3.3/config-3.3m directory to python3.3/config
> in the staging directory

This description doesn't match what the code is doing. The code creates
a symbolic link in $(HOST_DIR), not $(STAGING_DIR).

Also, this commit log doesn't explain *why* this is needed in the first
place. The commit log only explains what the patch is doing (which we
can easily find out by reading the code), but lacks an explanation of
the underlying reasons.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
