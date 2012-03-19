From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 19 Mar 2012 17:08:21 +0100
Subject: [Buildroot] [PATCH 1/6] Change the /etc/mtab symlink to use an
	absolute path
In-Reply-To: <16e6e9e98f4ece9b61ea5df842bd1c3927796299.1332172636.git.maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Mon, 19 Mar 2012 16:59:35 +0100")
References: <cover.1332172636.git.maxime.ripard@free-electrons.com>
 <cover.1332172636.git.maxime.ripard@free-electrons.com>
 <16e6e9e98f4ece9b61ea5df842bd1c3927796299.1332172636.git.maxime.ripard@free-electrons.com>
Message-ID: <87mx7ciney.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> As systemd checks if /etc/mtab is a symlink to /proc/mount or
 Maxime> /proc/self/mounts, we need to change it so that we can run systemd.

 Maxime> http://cgit.freedesktop.org/systemd/tree/src/main.c#n1082

Committed, thanks.

-- 
Bye, Peter Korsgaard
