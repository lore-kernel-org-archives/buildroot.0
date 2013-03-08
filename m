From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Mar 2013 13:16:25 +0100
Subject: [Buildroot] Problem with buildroot-2013.02 - ncurses
In-Reply-To: <84EA0F7435E5F64C9B660453645DB90497AD52AA50@DSW350.wattens.swarovski.com>
References: <84EA0F7435E5F64C9B660453645DB90497AD4DEF0D@DSW350.wattens.swarovski.com>
 <20130307093024.30cb7d23@skate>
 <84EA0F7435E5F64C9B660453645DB90497AD52A6B0@DSW350.wattens.swarovski.com>
 <20130307140818.0d48c197@skate>
 <84EA0F7435E5F64C9B660453645DB90497AD52AA50@DSW350.wattens.swarovski.com>
Message-ID: <20130308131625.1bcf31c2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spielmann Werner,

On Fri, 8 Mar 2013 12:29:10 +0100, Spielmann Werner wrote:

> After solving the being-not-emcacs problem of jove with the help of Thomas Petazzoni I ran into the next problem caused by ncurses:

Please post on pastebin the entire output of:

 make host-ncurses-dirclean
 make

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
