From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 17:10:23 +0200
Subject: [Buildroot] [PATCH 1/2] package/tiff: create a symlink to
 libtiff-4.pc
In-Reply-To: <1430577154-5790-1-git-send-email-romain.naour@openwide.fr>
References: <1430577154-5790-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150502171023.3e3fe346@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat,  2 May 2015 16:32:33 +0200, Romain Naour wrote:
> Some packages like libevas still use pkg-config --libs libtiff
> to find libtiff's LDFLAGS.
> Since Buildroot only have tiff 4.0.3, create a symlink to
> libtiff-4.pc for theses packages.

Isn't it better to fix libevas to use libtiff-4 instead?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
