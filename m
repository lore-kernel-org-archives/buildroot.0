From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Mon, 28 Nov 2011 12:50:22 -0600
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <201111281139.37028.minimod@morethan.org>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <20111128165422.49361aed@skate>
 <002001ccade8$e03e9f00$0400a8c0@dspcgrnzks9p98>
 <201111281139.37028.minimod@morethan.org>
Message-ID: <002701ccadfe$961b9430$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Try a "make clean" then try again.
> The missing file was reported to be the downloaded (*/dl/* directory)
> the system may have that marked as already downloaded.

>>> ethercat 1.0 Downloading
file:///home/user1/Desktop/EtherCAT4Atmel//etherlabmaster.tar.bz2:
Unsupported scheme "file".
>>> ethercat 1.0 Extracting
bzcat: Can't open input file
/home/user1/buildroot-2011.05/dl/etherlabmaster.tar.bz2: No such file or
directory.
tar: This does not look like a tar archive
tar: Exiting with failure status due to previous errors
make: ***
[/home/user1/buildroot-2011.05/output/build/ethercat-1.0/.stamp_extracted]
Error 2
user1 at linux-0mmn:~/buildroot-2011.05>


I did the 'make clean' and now it appears like it doesn't like the "file://"
part of things.  Has anyone done it like this?  The website for EtherCAT
doesn't point directly at a .bz2 file and so I can't do the http:// method.

Thanks.
