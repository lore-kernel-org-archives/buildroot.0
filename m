From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Apr 2021 17:59:10 +0200
Subject: [Buildroot] [PATCH] package/mender: add nodbus to tags if dbus
 is not selected
In-Reply-To: <20210401154453.144605-3-aduskett@gmail.com>
References: <20210401154453.144605-1-aduskett@gmail.com>
 <20210401154453.144605-3-aduskett@gmail.com>
Message-ID: <20210401175910.13b92177@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  1 Apr 2021 08:44:53 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> The README.md file suggests passing "nodbus" as a tag if dbus is not selected.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

Interesting. What does it do, if D-Bus is not a build dependency, what
there is to enable/disable within the Mender code base?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
