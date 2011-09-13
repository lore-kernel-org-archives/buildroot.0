From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 13 Sep 2011 10:42:06 +0200
Subject: [Buildroot] samba: bump to 3.5.11
In-Reply-To: <87zki95urn.fsf@macbook.be.48ers.dk>
References: <87zki95urn.fsf@macbook.be.48ers.dk>
Message-ID: <1315903328-20842-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

here's another patch-set for the samba update. This time we
bump to 3.5.11 and I have reintroduced a patch that fixes
the mount.cifs compile issue by hardcoding the /etc/fstab path
instead of pulling it from the (non-existant) fstab.h header.

This time I have successfully compiled this with all Samba
tools enabled.


Regards,
Sven
