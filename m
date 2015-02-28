From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Feb 2015 10:44:51 +0100
Subject: [Buildroot] [PATCH 3/7] x11r7/xcb-util-keysyms: depends on
	host-pkgconf and libxcb
In-Reply-To: <1425028764-1146-4-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Fri, 27 Feb 2015 10:19:20 +0100")
References: <1425028764-1146-1-git-send-email-fabio.porcedda@gmail.com>
 <1425028764-1146-4-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <8761amz7xo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 > Fix build failure:
 > ./configure: line 11453: /home/tetsuya/buildroot/br/output/host/usr/bin/pkg-config: No such file or directory
 > configure: error: in `/home/tetsuya/buildroot/br/output/build/xcb-util-keysyms-0.3.9':
 > configure: error: The pkg-config script could not be found or is too old.  Make sure it
 > is in your PATH or set the PKG_CONFIG environment variable to the full
 > path to pkg-config.

 > Fix build failure:
 > configure: error: Package requirements (xcb >= 1.4) were not met:

 > Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
