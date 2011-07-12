From: raymond zhao <raymond.zhao.ml@gmail.com>
Date: Tue, 12 Jul 2011 16:26:49 -0400
Subject: [Buildroot] how BR download the linux kernel now
Message-ID: <CAAa76NT59eY9Kbhej2vyk23GBP-ofu5FyApsnHpsgHvSLzZaNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I checked out the latest version of the buildroot, and noticed that
the linux.mk was changed a lot. Thomas checked in a version with log
message "linux: convert to the GENTARGETS infrastructure". And, from
there, I am confused. How the BR download the linux kernel now? I
mean, before this version, there are download, extraction and patch.
But they are removed and there is only LINUX_DOWNLOAD_PATCHES in the
new version. Where is the script for BR to download the kernel source
code now?

thanks,

Raymond
