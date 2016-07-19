From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Tue, 19 Jul 2016 12:02:03 +0200
Subject: [Buildroot] [PATCH 2/2] fcgiwrap: Add a patch to link with
	libsystemd, not libsystemd-daemon.
In-Reply-To: <20160718232530.6d98be5e@free-electrons.com>
References: <1468852130-1525-1-git-send-email-thomas.claveirole@green-communications.fr>
 <1468852130-1525-3-git-send-email-thomas.claveirole@green-communications.fr>
 <20160718232530.6d98be5e@free-electrons.com>
Message-ID: <1554038.NzUkQDIuDc@hardbit>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Also, both patches should be submitted upstream, especially since
> upstream is hosted on Github, which makes it really easy to submit
> pull requests.

You are right indeed.  I just did it:

https://github.com/gnosek/fcgiwrap/pull/37

Thanks for this quick feedback,
-- 
Thomas Claveirole <thomas.claveirole@green-communications.fr>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160719/1a66da47/attachment.asc>
