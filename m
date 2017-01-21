From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Jan 2017 22:04:55 +0100
Subject: [Buildroot] Updating GNU classpath
In-Reply-To: <98391600-4a26-2b57-ba89-fb2bd4dd1787@cartelsol.com> (Marcus
 Hoffmann's message of "Sat, 21 Jan 2017 19:23:43 +0100")
References: <98391600-4a26-2b57-ba89-fb2bd4dd1787@cartelsol.com>
Message-ID: <87pojgp1jc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcus" == Marcus Hoffmann <m.hoffmann@cartelsol.com> writes:

 > Hey,
 > I wanted to update GNU classpath to version 0.99 (released March 2012,
 > but anyway, latest release).

Nice, the package could indeed use an update.

 > Unfortunately there seems to be a bug in the autoconf scripts, such that
 > configure always fails when specifying --disable-tools[1].
 > I'm no expert in autoconf scripts but I looked at them for some time and
 > couldn't find the root cause of the bug.

 > Can we enable the tools option and delete the binaries before/after
 > installing? Or just enable this option and be done with it?
 > It bumps the package size from ~ 9.6 MB to 10.7 MB.

It is not optimal, but imho good enough for a first iteration. Please
post a patch, then perhaps someone can figure out what goes wrong.

-- 
Bye, Peter Korsgaard
