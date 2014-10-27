From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Oct 2014 01:16:57 +0100
Subject: [Buildroot] [PATCH 08/51] geoip: bump version
In-Reply-To: <1414349157-22749-8-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Sun, 26 Oct 2014 19:45:14 +0100")
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1414349157-22749-8-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87siia5pty.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > The tarball from the release contains the configure and Makefile.in,
 > there's no longer need to AUTORECONF.

 > Add a hash file since the tarball has been uploaded by the maintainer.

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Seems like the license info changed:

cat: /home/peko/source/buildroot/output/build/geoip-1.6.2/LICENSE: No such file or directory
package/geoip/geoip.mk:14: recipe for target 'geoip-legal-info' failed

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
