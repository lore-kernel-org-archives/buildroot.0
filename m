From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 May 2020 23:30:45 +0200
Subject: [Buildroot] Cross-compile mariadb-connector-c
In-Reply-To: <CADJjDh8R+_9Br-O9Dgy3Pp=WU7duOnOYEajGX3NJg324AaBx6Q@mail.gmail.com>
References: <CADJjDh8R+_9Br-O9Dgy3Pp=WU7duOnOYEajGX3NJg324AaBx6Q@mail.gmail.com>
Message-ID: <20200528233045.561f2808@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 28 May 2020 16:51:27 -0400
Todd Sampson <sampsonats@gmail.com> wrote:

> I'm trying to cross-compile mariadb-connector-c version 3.1.8.  When I
> select mysqlsupport and mariadb, it seems like the mariadb server gets put
> in my target too, which makes it very big.

Have you enabled BR2_PACKAGE_MARIADB_SERVER ? If
BR2_PACKAGE_MARIADB_SERVER is disabled, the server should not be
installed.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
