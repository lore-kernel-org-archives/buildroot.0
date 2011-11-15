From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Nov 2011 19:07:02 +0100
Subject: [Buildroot] [PATCH] clean-for-rebuild: also remove
 images_installed stamp
In-Reply-To: <1321378277-5625-1-git-send-email-arnout@mind.be>
References: <1321378277-5625-1-git-send-email-arnout@mind.be>
Message-ID: <20111115190702.6b9a2ddc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 15 Nov 2011 17:31:17 +0000,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> 
> Without this, a linux-rebuild or bootloader-rebuild will not install
> the rebuilt image in the images directory.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Should go into 2011.11.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
