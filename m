From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 06 Mar 2018 21:19:11 +0000
Subject: [Buildroot] [Bug 10846] error in compiling gnutls
In-Reply-To: <bug-10846-163@https.bugs.busybox.net/>
References: <bug-10846-163@https.bugs.busybox.net/>
Message-ID: <bug-10846-163-SLDKfpFqRT@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10846

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
The cited config.log fragment is unrelated to the shown error (1), please
try:

    $ make clean
    $ make

And if the error shows up again please provide your .config/defconfig file (see
http://nightly.buildroot.org/manual.html#reporting-bugs) and/or the complete
build/gnutls-3.5.17/config.log file...

(1) not all errors in config.log lead to an configure error, there are
many/hundreds of tests in there...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
