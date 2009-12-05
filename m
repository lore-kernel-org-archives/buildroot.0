From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 5 Dec 2009 09:46:10 -0600
Subject: [Buildroot] Help?  What happend to the Help on 2009.11?
Message-ID: <200912050946.13315.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Help not being displayed by menu config on at least some things.

Found by:
clean clone of repository;
checkout tag 2009.11
make menuconfig

now select 'help' on the first screen.
Note lack of help text (it used to default to the general help).
What is that 'selected by: m' ??  I don't recall seeing that before.

exit back to first screen;
select 'Target Architecture'
select 'help'

"There is no help available for this option."
???
Say what?  That choice statement still has help text on it.

Makes it sort of hard to test my new help messages (on a different clone).

Mike
