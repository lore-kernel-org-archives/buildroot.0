From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Oct 2019 23:11:31 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/network-manager: bump to
 version 1.21.2
In-Reply-To: <20191014205055.48281-1-james.hilliard1@gmail.com>
References: <20191014205055.48281-1-james.hilliard1@gmail.com>
Message-ID: <20191014231131.03b9c2b6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Oct 2019 14:50:55 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> per upstream commit: e9f2ea6c22f36cb7986d2228763629ed44b9e76b
> https://github.com/NetworkManager/NetworkManager/commit/e9f2ea6c22f36cb7986d2228763629ed44b9e76b
> 
> The update to the GPL text is purely cosmetic.

Except this commit is not just cosmetic: it adds COPYING.LGPL, and we
do not reference it, while we do mention that some parts of
network-manager are under LGPL. So, the version bump should update
LICENSE_FILES to include the new COPYING.LGPL, and the .hash file
should be updated as well to include its hash.

The COPYING.GFDL can probably be left out, since we don't install the
documentation on the target.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
