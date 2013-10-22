From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Oct 2013 17:13:24 +0200
Subject: [Buildroot] [PATCH 12/12] board: add warning to readme files
 explaining how to flash the target
In-Reply-To: <b67f14903e6e33f2790ff7ee8c82c658f8c12b01.1382127504.git.s.martin49@gmail.com>
References: <cover.1382127504.git.s.martin49@gmail.com>
 <b67f14903e6e33f2790ff7ee8c82c658f8c12b01.1382127504.git.s.martin49@gmail.com>
Message-ID: <20131022171324.0e0e607b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Fri, 18 Oct 2013 22:31:36 +0200, Samuel Martin wrote:
> Only add a warning message in readme.txt files giving intructions to
> flash the target memory device.
> 
> All others boards coming with a readme.txt files explain how to
> prepare a removable media or how to use the emulator.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

The current wording is quite scary, and doesn't even explain *why*
those particular board readme.txt files have such a warning. What about
just:

"""
WARNING: the below information will overwrite the platform bootloader.
Therefore, make sure you have a known-working recovery mechanism for
your platform, as we can't guarantee that the new bootloader will work.
"""

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
