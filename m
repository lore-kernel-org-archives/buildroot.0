From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Dec 2014 17:23:21 +0100
Subject: [Buildroot] [PATCH] xlib_libXau: add host-pkgconf its
	dependencies
In-Reply-To: <1417616322-41875-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Wed, 3 Dec 2014 14:18:42 +0000")
References: <1417616322-41875-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87r3wgya6e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > xlib_libXau needs pkg-config during the configure phase. Otherwise it
 > will fail with an error like this one:

Committed with the title fixed, thanks.

-- 
Bye, Peter Korsgaard
