From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 28 May 2014 19:07:16 +0200
Subject: [Buildroot] busybox-savedefconfig no rule to make target
Message-ID: <CA+TH9VkoFTiwFNwKeutQN5oCmU+y5MbpkFYF+qBbCvkV2urS3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

The manual says:

"busybox-menuconfig and busybox-savedefconfig ony work when busybox is enabled;"

I have busybox enabled, I modified the configuration with
busybox-menuconfig, saving the configuration raise this error:

make -C /home/angelo/DEV/BUILDROOT/buildroot
O=/home/angelo/DEV/BUILDROOT/br_ariag25_14_2/. busybox-savedefconfig
make[1]: *** No rule to make target `busybox-savedefconfig'.  Stop.
make: *** [_all] Error 2

Is this a bug?

Thank you!

-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
