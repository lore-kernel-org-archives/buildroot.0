From: Charles Musser <cmusser@sonic.net>
Date: Wed, 5 Jun 2013 15:16:49 -0700
Subject: [Buildroot] Buildroot and {Open,DD-}WRT
Message-ID: <E8FDE7E9-FA85-44C8-A6BE-04D152334B7B@sonic.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My (limited, but pleasing) experience with Buildroot is this:

- Configured Buildroot for the "mipsel" architecture and included (via "menuconfig") some libraries I was interested in.

- Added an additional package to build another library.

- Used the built cross-compiler to build a binary for the target.

- Popped the built application and libraries onto the target machine, which runs DD-WRT and ran them successfully.

My question is: where do Buildroot and DD-WRT (or for that matter OpenWRT) intersect? Buildroot is a complete solution, all the way to producing a flashable image. Are the *WRT distributions based on Buildroot (or use it). Can you add the *WRT sources to Buildroot and maybe take advantage of extra hardware support? How do these pieces interact (or do they)?

Thanks,

Chuck 
