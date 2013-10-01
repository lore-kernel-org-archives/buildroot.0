From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Oct 2013 11:55:08 +0200
Subject: [Buildroot] [PATCH] setserial: bump to version 2.17-45.3
In-Reply-To: <1380609394.20990.0.camel@phoenix>
References: <1380609394.20990.0.camel@phoenix>
Message-ID: <20131001115508.502bffbc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Axel Lin,

On Tue, 01 Oct 2013 14:36:34 +0800, Axel Lin wrote:
> Bump to patchlevel 3 since 2 is gone upstream.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

I believe we should get rid of the BR2_DEBIAN_MIRROR thing altogether,
and switch all packages that are sourced from Debian to use
http://snapshot.debian.org/ to avoid disappearing packages.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
