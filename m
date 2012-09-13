From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Sep 2012 09:33:15 +0200
Subject: [Buildroot] [PATCH] package: add new filesystem utilities
 category
In-Reply-To: <1347490459-4049-1-git-send-email-gustavo@zacarias.com.ar>
References: <1347490459-4049-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20120913093315.5aa27d5e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 12 Sep 2012 19:54:19 -0300, Gustavo Zacarias wrote:
> Add the new filesystem utilities category and move a bunch of packages
> into it.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

mtd is kind of a special case, as it contains both tools for
manipulating hardware (erasing/reflashing, etc.) and tools to
manipulate filesystems (JFFS2, UBIFS, etc.), so there's no perfect
place for it. So:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
