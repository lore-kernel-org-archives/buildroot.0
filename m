From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Apr 2013 22:36:13 +0200
Subject: [Buildroot] [PATCH 00/10] [reworked] Updating directfb and
	divine
In-Reply-To: <1362940371-25899-1-git-send-email-c.schoenert@gmail.com>
 (Carsten Schoenert's message of "Sun, 10 Mar 2013 19:32:41 +0100")
References: <1362940371-25899-1-git-send-email-c.schoenert@gmail.com>
Message-ID: <87zjwi4cle.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carsten" == Carsten Schoenert <c.schoenert@gmail.com> writes:

 Carsten> From: Carsten Schoenert <c.schoenert@gmail.com>
 Carsten> Hello,

 Carsten> after the reviewing of my previous patches by Thomas I have reworked
 Carsten> those patches. After some tests related to the dependencies of other
 Carsten> packages on directfb I expanded my patch series because of broken
 Carsten> dependencies by the newer directfb version.

 Carsten> The packages directfb-exambles and sawman are bumped to
 Carsten> current versions so the packages are buildable against the
 Carsten> newer directfb version.  The Qt package I doesn't have tested.

 Carsten> I added new entrys into Config.in.legacy for the renamed BR2
 Carsten> variables.  Hopefully in the correct format.

 Carsten> If something is still wrong please let me know.

Committed series, thanks.

-- 
Bye, Peter Korsgaard
