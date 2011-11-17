From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Nov 2011 20:50:10 +0100
Subject: [Buildroot] [PATCH 1 of 5 v2] Makefile.package.in: add utility
 functions find*clauses and notfirstword
In-Reply-To: <b6579582d02dd802adca.1321557990@devws108>
References: <patchbomb.1321557989@devws108>
 <b6579582d02dd802adca.1321557990@devws108>
Message-ID: <20111117205010.60a99ee3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 17 Nov 2011 20:41:48 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> Functions finddirclauses and findfileclauses help in building a find
> command that skips a set of directories and performs operations on a
> set of files. This pattern can for example be used to keep certain
> files or directories from being stripped, or to remove certain files
> from a package installation.

I must say I am not a big fan of this. Those macros are horribly
complicated to understand and they make the code really cryptic. I
think I would really prefer to see the implementation of these "do not
strip this file/directory" option to be done without those cryptic
macros.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
