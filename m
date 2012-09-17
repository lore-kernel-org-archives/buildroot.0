From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Mon, 17 Sep 2012 02:58:16 -0700 (PDT)
Subject: [Buildroot] SD card RFS
Message-ID: <1347875896.78793.YahooMailNeo@web164601.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello
?
I built root file system using Buildroot and it works OK on my target
ARM board, when settled?in NFS.
I tried to dislocate it to SD card. So I rebuilt kernel?to include Ext2
file system support.??At last?it worked, but what confuses me is kernel message:
?"EXT2-fs error (device mmcblk0p3): ext2_lookup: deleted inode referenced: 56899"
"read-only file system detected?"
mmcblk0p3 is Ext2?partion?which holds?RFS (kernel is at other partition).
I used "touch somefile"?to create file - it succeeded, also "ls -a > somefile" -
generate corect output to "somefile". So it seems to me -?RFS is not read only.
Then why above message ?
I tried using emacs- but seems like it has unusuall commands (Ctrl-x; Ctrl-s 
for example doesn't save file - no messages) so I didn't succeed editing "somefile". 
However, test described above, is quite illustrative - it saves data.
?
Regards
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120917/fc0e4ad3/attachment.html>
