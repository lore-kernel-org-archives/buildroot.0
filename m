From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 05 Feb 2012 10:58:21 +0100
Subject: [Buildroot] [PATCH 1/5] Add the systemd package
In-Reply-To: <4F2D2EE5.2000205@free-electrons.com> (Maxime Ripard's message of
 "Sat, 04 Feb 2012 14:13:09 +0100")
References: <1328279247-7277-1-git-send-email-maxime.ripard@free-electrons.com>
 <1328279247-7277-2-git-send-email-maxime.ripard@free-electrons.com>
 <87liojd5e5.fsf@macbook.be.48ers.dk>
 <4F2D2EE5.2000205@free-electrons.com>
Message-ID: <87y5shsite.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

Hi,

 >> Is this needed by systemd? I would prefer to see this as a seperate
 >> patch.

 Maxime> Yes, this is needed as it checks for /etc/mtab being equal to
 Maxime> /proc/mounts or /proc/self/mounts.

 Maxime> http://cgit.freedesktop.org/systemd/tree/src/main.c#n1082

 Maxime> Or I guess I can patch it as well...
 Maxime> What do you prefer ? A patch for systemd, a separate patch to change
 Maxime> this or keep it this way ?

No, I'm fine with the change to the skeleton, I just want it in a
seperate commit with an explanation (E.G. the systemd cgit link) so
people using another skeleton can easily figure out why/what to change.

 Maxime> Sorry, I used to have a line following this one, but it got
 Maxime> removed, will fix.

Great, thanks.

-- 
Bye, Peter Korsgaard
