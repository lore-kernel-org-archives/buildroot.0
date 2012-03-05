From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Mar 2012 11:04:18 +0100
Subject: [Buildroot] [PATCH 1/1] package: fix WGET download method
In-Reply-To: <20120305094229.GC28936@sapphire.tkos.co.il>
References: <cover.1330939857.git.thomas.petazzoni@free-electrons.com>
 <da800fd2ac3ecc63622314e0b140573b05924d7a.1330939857.git.thomas.petazzoni@free-electrons.com>
 <20120305094229.GC28936@sapphire.tkos.co.il>
Message-ID: <20120305110418.1480ce9d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 5 Mar 2012 11:42:29 +0200,
Baruch Siach <baruch@tkos.co.il> a ?crit :

> 'rm -f' may be better here, as wget might error out before creating
> any file, thus causing a spurious "No such file or directory" message.

Correct, will send a new version.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
