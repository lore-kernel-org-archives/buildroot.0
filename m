From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 27 Mar 2008 13:50:54 +0100
Subject: [Buildroot] make clean problem and patch
In-Reply-To: <47EB6E57.4080101@logicway.de>
References: <47EB6E57.4080101@logicway.de>
Message-ID: <20080327125053.GE13379@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 27, 2008 at 10:52:23AM +0100, Arndt Kritzner wrote:
>"make clean" fails after incomplete build attempts because of missing
>files or directories. The attached patch precedes the clean actions with
>a "-" to ignore these errors. With atstk1002_defconfig the packages
>avahi, dropbear, file, lzo, ncftp and strace caused this sort of aborts.
>The attached patch concerns these packages.

Unfortunately your list was incomplete.
Fixed in my tree, thanks for mentioning this!

PS:
http://repo.or.cz/w/buildroot.git?a=commit;h=4c0e0b63bdc1fd65889bbaeb3d6ad8eb4d0fe22f

cheers,
Bernhard
