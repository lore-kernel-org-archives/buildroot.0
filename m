From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 12 Feb 2008 16:46:39 -0200
Subject: [Buildroot] [PATCH] John Voltz changes part 3 (sqlite samba and
	tiff)
Message-ID: <d6cda7730802121046w443d73b0w2b2bd8480ad87e4a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fix sqlite paths (install headers in /usr/include and libs in
/usr/libs instead of /include and /usr of STAGING_DIR )

Please patch with -p1

-----

samba versiom bump (3.0.28)

Please patch with -p1

--

same thing for tiff as sqlite.
Please use -p1
-------------- next part --------------
A non-text attachment was scrubbed...
Name: fix-sqlite-path.patch
Type: text/x-patch
Size: 1332 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080212/1518fed1/attachment.bin 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: samba-version-bump.patch
Type: text/x-patch
Size: 533 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080212/1518fed1/attachment-0001.bin 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: fix-tiff-path.patch
Type: text/x-patch
Size: 1758 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080212/1518fed1/attachment-0002.bin 
