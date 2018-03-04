From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Mar 2018 21:22:39 +0100
Subject: [Buildroot] [PATCH 0/3] package/systemd: unbreak a few stuf..
In-Reply-To: <cover.1520183159.git.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 4 Mar 2018 18:06:14 +0100")
References: <cover.1520183159.git.yann.morin.1998@free.fr>
Message-ID: <87y3j78ub4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Hello All!
 > This series, starting with a patch from Trent, is an attempt to fix
 > most of the known systemd issues, especially with respect to the DBus
 > socket location and the rest of the factory stuff.

 > It should supersed all the previous attempts.

 > Some work is probably still needed to clean up all the mess. The most
 > important issue left over is that the /var state might be inconsistent,
 > should the filesystem generation fails (e.g. too-small a read-only
 > ext2 filesystem is attempted). This would be fixed by my other series
 > about the handling of filesystems...

 > At least, this is probably just enough for the release.

Indeed - Committed series, thanks!

-- 
Bye, Peter Korsgaard
