From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Sep 2015 14:39:30 +0200
Subject: [Buildroot] [RFC] Add pyudev package
In-Reply-To: <1441881232-8107-1-git-send-email-yegorslists@googlemail.com>
References: <1441881232-8107-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20150910143930.00227183@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear yegorslists at googlemail.com,

On Thu, 10 Sep 2015 12:33:51 +0200, yegorslists at googlemail.com wrote:
> This package provides Python bindings for udev. The package can be successfully
> installed, but it fails to find libudev via find_library(). See [1] for details.
> I have even tried to install binutils, but it fails anyway.
> 
> This issue is quite old [2], but so far there is no official solution.

I haven't looked in detail, but isn't the solution to patch the Python
find_library() function to make it not rely on gcc/objdump?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
