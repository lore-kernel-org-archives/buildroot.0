From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 15:34:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/imx-sc-firmware: bump to
 version 1.2.1
In-Reply-To: <20191222142421.13cd522c@windsurf> (Thomas Petazzoni's message of
 "Sun, 22 Dec 2019 14:24:21 +0100")
References: <20191218130429.847805-1-juju@cotds.org>
 <CAOMZO5D_Dh2sgweJ+0U_os-jP3igeVbO2XJmeesZTdoQDe86gA@mail.gmail.com>
 <94f6389ba7bd24a86cdec3e8295fddad@cotds.org>
 <CAOMZO5CTpqORMwjZi5681X7h1pngWZJzF-VZHvaVHkEe4CYq1g@mail.gmail.com>
 <bb1e9dbdd73a1e0b8fead464ddf9fa83@cotds.org>
 <20191222142421.13cd522c@windsurf>
Message-ID: <877e2o2zv6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> For example, for the imx-sc-firmware, the list of choices would be:
 >> - 1.1.4 (4.14.78_1.0.0)
 >> - 1.2.1 (4.14.98_2.0.0)
 >> - 1.2.2 (4.19.35_1.0.0)
 >> - 1.2.7.1 (4.19.35_1.1.0)
 >> 
 >> What do you think about this approach?

 > In general, we don't really like to have too much version selection for
 > components, because it makes the maintenance difficult, and it is also
 > more difficult for users as they have to know which version to use.

 > However, for the specific case of this firmware package, I don't really
 > see any other option than what you're proposing.

 > One question is: how does it work if one wants to use the upstream
 > Linux kernel?

Agreed, presumably these crazy version dependencies between components
will get sorted out once the platform becomes a bit more mature?

-- 
Bye, Peter Korsgaard
