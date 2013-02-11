From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Feb 2013 16:42:31 +0100
Subject: [Buildroot] [RFC] Python 3 external packages support
In-Reply-To: <1360597236.46911.YahooMailNeo@web171802.mail.ir2.yahoo.com>
References: <1360594442.60393.YahooMailNeo@web171801.mail.ir2.yahoo.com>
 <20130211160908.2da60098@skate>
 <1360595860.22602.YahooMailNeo@web171805.mail.ir2.yahoo.com>
 <20130211162231.0ac06f9c@skate>
 <1360597236.46911.YahooMailNeo@web171802.mail.ir2.yahoo.com>
Message-ID: <20130211164231.1baeb62f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Patrick,

On Mon, 11 Feb 2013 15:40:36 +0000 (GMT), Patrick wrote:

> Does it sounds accetable to move all the Python related stuff
> (python2, python3 and all python-* packages) to a single directory
> called python ? I know that you would like to have a flat
> arborescence for all packages, but this will help to provide a more
> friendly python menu

The tree of directory is not related to the layout of the menus in
menuconfig/xconfig. So you can perfectly have a flat tree of
directories, and an hierarchical representation of options in
menuconfig/xconfig.

In terms of directories, we prefer a flat solution I believe, even
though it's true some package groups do have their own subdirectory
(for example x11r7).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
