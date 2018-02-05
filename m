From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 05 Feb 2018 16:46:03 +0000
Subject: [Buildroot] [Bug 9781] ti-sgx-km build on kernel >4.1
In-Reply-To: <bug-9781-163@https.bugs.busybox.net/>
References: <bug-9781-163@https.bugs.busybox.net/>
Message-ID: <bug-9781-163-ApHS144AJk@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9781

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WONTFIX
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This really is an upstream problem. The Git repository at
http://git.ti.com/graphics/omap5-sgx-ddk-linux has newer versions, but the Git
history is a bit of a mess, making it difficult to know if the latest master
branch still applies to the SoCs ti-sgx-km currently supports.

Someone having access to HW and interested in TI platforms should look into
this. Could you submit a patch updating the ti-sgx-km to a newer version?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
