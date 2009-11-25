From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 25 Nov 2009 11:09:05 +0100
Subject: [Buildroot] patch : dbus  remove existing symbolic link
In-Reply-To: <E4B91C4D3521446D8F69144609024A53@apexjs> (Sagaert Johan's
	message of "Tue\, 24 Nov 2009 11\:18\:55 +0100")
References: <E4B91C4D3521446D8F69144609024A53@apexjs>
Message-ID: <87my2ac3we.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi
 Sagaert> Building dbus fails if the symbolic link is already present.
 Sagaert> this should solve the issue.

Thanks, but there's no need for the symlink check as it will always be
true (we create symlink in post-install hook).

I've committed a slightly reworked patch to git.

-- 
Bye, Peter Korsgaard
