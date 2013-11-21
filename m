From: =?UTF-8?q?Arnaud=20R=C3=A9billout?= <rebillout@syscom.ch>
Date: Thu, 21 Nov 2013 16:16:10 +0100
Subject: [Buildroot] LFTP: a sophisticated ftp/sftp/http/fish client with
	few dependencies
Message-ID: <1385046971-7707-1-git-send-email-rebillout@syscom.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

if you're interested, here comes a patch to add LFTP to the buildroot packages.

LFTP is a versatile and reliable FTP/SFTP/HTTP/FISH client. It has a mirror mode, which is very useful to backup some data on a remote server. It also supports bittorrent protocol.

The software itself has been around for quite a long time (1993, so it's 20 years old now!), and it's still actively maintained.

The architecture is modular, and the different protocols and commands can be compiled as libraries. Therefore it's possible to put only what's needed on the target, and save space.

And since I used it, it's been working great, it's far better than the GVFS/rsync couple I used before to backup some data.

I hope this can be useful for someone out there,
Best regards,
Arnaud.
