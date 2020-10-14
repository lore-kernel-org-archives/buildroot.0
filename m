From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 13:37:13 +0200
Subject: [Buildroot] [PATCH 0/1] jquery: bump to version 3.5.1
In-Reply-To: <20201014110819.udxf25qnvs56nmmo@zenon.in.qult.net>
References: <20201014110819.udxf25qnvs56nmmo@zenon.in.qult.net>
Message-ID: <20201014133713.07b6eea7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 14 Oct 2020 13:08:19 +0200
Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr> wrote:

> It seems at least some packaged jQuery plugins are not necessarily
> adapted to support jQuery version 3+.  It seems jquery-datetimepicker
> may not be compatible, while jquery-sidebar declares no dependency on
> any jquery version, but has not been updated for the past five years.

So perhaps we should drop those jquery plugins from Buildroot before
updating, no? Or you're just not sure that they are not compatible ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
