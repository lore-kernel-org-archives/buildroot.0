From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Dec 2012 17:00:21 -0800
Subject: [Buildroot] [PATCH] skeleton: add /etc/nsswitch.conf
In-Reply-To: <1354468412-29281-1-git-send-email-sho@relinux.de> (Stephan
 Hoffmann's message of "Sun, 2 Dec 2012 18:13:32 +0100")
References: <1354468412-29281-1-git-send-email-sho@relinux.de>
Message-ID: <87wqx054re.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:

 Stephan> Toolchain Linaro 2012_09 and possibly other glibc based ones
 Stephan> rely on the existence of nsswitch.conf. If it's missing names
 Stephan> from /etc/hosts are not resolved and thus "localhost" is not
 Stephan> known.

Committed, thanks.

-- 
Bye, Peter Korsgaard
