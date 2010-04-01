From: Will Wagner <will_wagner@carallon.com>
Date: Thu, 01 Apr 2010 13:51:48 +0100
Subject: [Buildroot] [PATCH 01/16] libdrm: bump version to 2.4.19
In-Reply-To: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
References: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
Message-ID: <4BB496E4.3050102@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Still learning how to use got send-email, was hoping it would let me 
write some covering words, I'm sure it can, just need to work out the 
option.

This patch series builds on Paulius's work on x11r7.

It bumps the version of a number of patches (including Paul Jones' 
libdrm bump), but it also changes over to use Kernel Mode Settings for 
the graphics drivers. Not sure how to specify in a package that a 
certain kernel version is needed.

The patch series is also available via git at:

git://gitorious.org/willw-buildroot/willw-buildroot.git x11r75patches

Will
