From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 21 Jan 2013 23:58:37 +0100
Subject: [Buildroot] [PATCH] vsftpd: add empty directory /usr/share/empty
In-Reply-To: <1358792489-13488-1-git-send-email-sho@relinux.de> (Stephan
 Hoffmann's message of "Mon, 21 Jan 2013 19:21:29 +0100")
References: <1358792489-13488-1-git-send-email-sho@relinux.de>
Message-ID: <871ude6t42.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:

 Stephan> Vsftpd needs an empty directory where it can chroot.
 Stephan> If /usr/share/empty isn't present it refuses to work in the default
 Stephan> configuration.

Committed, thanks.

-- 
Bye, Peter Korsgaard
