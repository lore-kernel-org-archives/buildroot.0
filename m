From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 11:01:34 +0200
Subject: [Buildroot] error while make in builtroot
In-Reply-To: <CAE5B2F-d-7VRFZ5PCwc8Ued1CTSCrP6mGpyH+2qPGHAA2mH9tQ@mail.gmail.com>
References: <CAE5B2F-d-7VRFZ5PCwc8Ued1CTSCrP6mGpyH+2qPGHAA2mH9tQ@mail.gmail.com>
Message-ID: <20170722110134.78333481@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Jul 2017 13:15:52 +0530, Anand Chaudhari wrote:
> Creating journal (4096 blocks): done
> Copying files into the device: __populate_fs: Could not allocate block in
> ext2 filesystem while writing file "libiconv.so.2.6.0"
> mkfs.ext4: Could not allocate block in ext2 filesystem while populating
> file system

You have to increase the size of the filesystem image to be produced.
See option BR2_TARGET_ROOTFS_EXT2_SIZE.

Best regards, 

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
