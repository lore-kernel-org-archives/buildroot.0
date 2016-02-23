From: Patrick Doyle <wpdster@gmail.com>
Date: Tue, 23 Feb 2016 11:30:25 -0500
Subject: [Buildroot] Include binary firmware blob in image
Message-ID: <CAF_dkJDzeoumYA2KKCa2oxo9NwKg+cYf0t=EhedY=up04NbuvA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Short version:
What is the best way to include a binary firmware blob fetched from
GitHub in a buildroot image?

Long version:
I am using the wilc1003_firmware.bin file available in the
https://github.com/linux4sc/wireless-firmware GitHub repository.  It
needs to be installed in /lib/firmware/atmel on my rootfs.

I could certainly write a post_build.sh script to clone the repo and
copy the file to the rootfs, but this doesn't feel like the most
buildroot-esque way to do this.  I feel like I should create a package
(where should I put it in the menu hierarchy?) and use that.

Is there an existing example I could follow for this sort of package?

Can folks recommend any tips or tricks for writing this package from scratch?

--wpd
