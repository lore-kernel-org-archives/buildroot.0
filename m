From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Jul 2017 07:41:22 +0000
Subject: [Buildroot] [Bug 10056] No .config file was produced in /buildroot
	folder
In-Reply-To: <bug-10056-163@https.bugs.busybox.net/>
References: <bug-10056-163@https.bugs.busybox.net/>
Message-ID: <bug-10056-163-RnOPGZ9lmO@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10056

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
             Status|NEW                         |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
First of all, please *stop* filing bugs for things that are not bugs but user
issues.

> no .config file was produces in /buildroot folder 
> despite the message. Please see the screenshot and
> advise me how to solve this problem. Did something 
> change in where Buildroot produces this .config file.

A .config file was definitely produced, I believe you haven't looked properly.

Also, please don't attach screenshots, but copy/paste the text.

> in order to enable "SUDO" command in the image, I have to
> add BR2_PACKAGE_SUDO=y into this .config file.

Not, the .config file should not be edited manually. You should run "make
menuconfig" and adjust the configuration.

Please read the Buildroot manual and training slides.

Also, your next bug reports that are not bugs but user issues will be
immediately closed as INVALID, without any explanation.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
