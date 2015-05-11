From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 May 2015 00:19:59 +0200
Subject: [Buildroot] [PATCH] package/gcc (arc): backport PR56780 patches
In-Reply-To: <1431380716-5176-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Mon, 11 May 2015 23:45:16 +0200")
References: <1431380716-5176-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <878ucuiwog.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > --disable-install-libiberty configure option is broken
 > in gcc 4.8.x, so libiberty.a is always installed in HOST_DIR.

 > This library broke the host-gdb build due to a fpic/fPIC issue.

 > Note: host-binutils-arc-2014.12 install libiberty.a in HOST_DIR
 > but it was overwritten by the gcc one. The host-binutils's
 > libiberty.a also broke the host-gdb build. This should be
 > fixed in a followup patch.

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 > Cc: Alexey Brodkin <abrodkin@synopsys.com>
 > ---
 > Alexey, --disable-install-libiberty doesn't work
 > for host-binutils-arc-2014.12. Can you have a look ?
 > Thanks

Committed, thanks.

-- 
Bye, Peter Korsgaard
