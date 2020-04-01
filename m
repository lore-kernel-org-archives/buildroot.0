From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Apr 2020 07:22:36 +0200
Subject: [Buildroot] [PATCH 02/12] package/pango: enable
 gobject-introspection support
In-Reply-To: <20200401002134.1779241-2-aduskett@gmail.com>
References: <20200401002134.1779241-1-aduskett@gmail.com>
 <20200401002134.1779241-2-aduskett@gmail.com>
Message-ID: <20200401072236.32aa833e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 31 Mar 2020 17:21:24 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> If gobject-introspection is selected, add the gobject-introspection package to
> the dependency list and set the conf opt --enable-introspection for both host
> and target.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Why for the host ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
