From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Tue, 5 Apr 2011 09:48:22 +0200
Subject: [Buildroot] Buildroot "install" wrapper to preserve file permissions
Message-ID: <BANLkTi=gd8UtSZLpam0=Luyq8dZzcdfO_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

An idea born out of the lately device_table.txt and install issues
discuessed lately.

In other tools similar to Buildroot (e.g. Axis SDK) I've seen an
"install" wrapper which sort of populate an device_table.txt while
installing each component.

In that way, it will preserve any setup, owner and permission on every
file without any global device_table.txt modifications.

(The Axis SDK actually uses meta files in the target dir, but that
would require a whole lot of tool patching while a dynamically written
device_table.txt would work as well)

How would you like this sort of approach in Buildroot?
