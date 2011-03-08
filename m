From: Desroches, Ludovic <Ludovic.Desroches@atmel.com>
Date: Tue, 8 Mar 2011 17:44:06 +0100
Subject: [Buildroot] How to add a board with Buildroot 2011.02
Message-ID: <F41B82AC38A41A41868925971DCBED9E06EFEFC0@rfomb01.corp.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I wanted to know how I can add in a proper way a new board to Buildroot following the policy introduced into the last release.

I have read the discussion between square(Thomas) :p and the documentation but I still have questions:

1) On one side I have read that target/device folder should host things such as kernel conf files or various board-specific patches and on the other side I have read into the documentation to use the board folder. So which one I have to use ?

2) What about the skeleton policy ? Before Atmel had its own skeleton. There are not so many changes from the generic skeleton. Then I think we won't need to have our own one. Moreover, if we provides many board configurations it's not a good idea to duplicate it. To avoid this, what do you suggest? I was thinking we can have a small skeleton with only files changing from the generic ones or patches; copying or patching can de bone by the post build script.

Do you plan other changes about board configuration into the next release ? I have seen the device_table.txt split.


Regards,

Ludovic Desroches 
