From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Nov 2011 08:35:39 +0100
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <002701ccadfe$961b9430$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <20111128165422.49361aed@skate>
 <002001ccade8$e03e9f00$0400a8c0@dspcgrnzks9p98>
 <201111281139.37028.minimod@morethan.org>
 <002701ccadfe$961b9430$0400a8c0@dspcgrnzks9p98>
Message-ID: <20111129083539.0eb88dab@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 28 Nov 2011 12:50:22 -0600,
"Jeff Krasky" <jeff.krasky@dspcg.com> a ?crit :

> >>> ethercat 1.0 Downloading
> file:///home/user1/Desktop/EtherCAT4Atmel//etherlabmaster.tar.bz2:
> Unsupported scheme "file".

Support for "file" has been added in 2011.11, and you're using 2011.05,
so it's not supported.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
