From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Sep 2010 08:02:35 +0200
Subject: [Buildroot] [PATCH] host tools: create the host sed in
 $(O)/host/
In-Reply-To: <1284420434-22718-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1284420434-22718-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <20100914080235.2345b253@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Sep 2010 01:27:14 +0200
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> wrote:

> The host sed does not belong to $(O)toolchain/ but
> really belongs to $(O)/host/

In my opinion, the host-sed does not belong anywhere, we could just use
the real host sed, and remove all the crap to detect if the host sed is
good or not, the symlinking stuff, etc.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
