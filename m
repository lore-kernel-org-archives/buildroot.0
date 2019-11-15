From: Whitney, Scott <scwhitn@amazon.com>
Date: Fri, 15 Nov 2019 19:40:09 +0000
Subject: [Buildroot] Rebuilding Linux after modifying Linux device tree in
 output/build directory?
Message-ID: <d508ce60a63d4182a02ddfadaeb042ac@EX13D04UEA001.ant.amazon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot community,

I need to run some experiments where I may need to make a number of minor modifications to the Linux Device tree, for example to change PWM outputs to GPIO outputs, add some extra GPIO inputs, etc.

Is there a way that I can force a minimal rebuild based on such a local change?  Buildroot does not seem to keep track of many dependencies to trigger a rebuild such as the DTS file being newer than the Linux image.

Is "make linux-rebuild" a viable option, or is there a better way to rebuild only what is required due to the Device Tree change?

Thanks for your help,

Scott
