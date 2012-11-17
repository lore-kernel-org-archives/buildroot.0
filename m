From: Richard Braun <rbraun@sceen.net>
Date: Sat, 17 Nov 2012 15:03:07 +0100
Subject: [Buildroot] [PATCH] Warn the user about the usage of
 output/target as the root filesystem
In-Reply-To: <1353160334-30174-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1353160334-30174-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20121117140307.GA6320@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 17, 2012 at 02:52:14PM +0100, Thomas Petazzoni wrote:
> +This directory does *not* contain the root filesystem that you can use
> +on your embedded system. Since Buildroot does not run as root, it
> +cannot create device files and set the permissions and ownership of
> +files correectly in this directory to make it usable as a root
> +filesystem.

Typo at "correectly".

-- 
Richard Braun
