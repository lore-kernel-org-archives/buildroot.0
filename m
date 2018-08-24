From: Niall Parker <stuff@npengineering.ca>
Date: Fri, 24 Aug 2018 15:48:06 -0700
Subject: [Buildroot] do config fragments work ?
Message-ID: <e123e7b0-718c-d403-d7c2-ba9e571b6596@npengineering.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm trying to apply some minor tweaks to the default config for uboot 
and using fragments seemed the best approach however the changes don't 
appear to make it into the final .config used for the build. For 
example, using a fragment containing CONFIG_BOOTDELAY? 1 still results 
in the binary using the default bootdelay of 2 (of course I can make 
uboot-menuconfig and set the boot delay there and it will stick but I 
was hoping to clump the config customizations into a simple fragment).

Not much documentation I've found on using fragments, maybe I'm not 
using them correctly (though the build log does recognize the fragment 
is selected and indicates it is merged).

Any help appreciated, thanks.

 ??? ??? ??? ... Niall
