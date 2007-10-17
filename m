From: Robert P. J. Day <rpjday@crashcourse.ca>
Date: Wed, 17 Oct 2007 04:43:39 -0400 (EDT)
Subject: [Buildroot] toolchain/kernel-headers/Config.in 2.6.22/23 typo?
Message-ID: <Pine.LNX.4.64.0710170441430.28193@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


  from the file toolchain/kernel-headers/Config.in:

config BR2_DEFAULT_KERNEL_HEADERS
        string
        default "2.4.25"        if BR2_KERNEL_HEADERS_2_4_25
        default "2.4.27"        if BR2_KERNEL_HEADERS_2_4_27
        default "2.4.29"        if BR2_KERNEL_HEADERS_2_4_29
        default "2.4.31"        if BR2_KERNEL_HEADERS_2_4_31
        default "2.6.9"         if BR2_KERNEL_HEADERS_2_6_9
        default "2.6.11"        if BR2_KERNEL_HEADERS_2_6_11
        default "2.6.12"        if BR2_KERNEL_HEADERS_2_6_12
        default "2.6.20.4"      if BR2_KERNEL_HEADERS_2_6_20_4
        default "2.6.20.20"     if BR2_KERNEL_HEADERS_2_6_20
        default "2.6.21.5"      if BR2_KERNEL_HEADERS_2_6_21_5
        default "2.6.21.7"      if BR2_KERNEL_HEADERS_2_6_21
        default "2.6.22.1"      if BR2_KERNEL_HEADERS_2_6_22_1
        default "2.6.22.10"     if BR2_KERNEL_HEADERS_2_6_22_10
        default "2.6.22.10"     if BR2_KERNEL_HEADERS_2_6_22
        default "2.6.23"        if BR2_KERNEL_HEADERS_2_6_22  [????]
        default "2.6.23"        if BR2_KERNEL_HEADERS_SNAP

shouldn't that read "BR2_KERNEL_HEADERS_2_6_23"?

rday

-- 
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
========================================================================
