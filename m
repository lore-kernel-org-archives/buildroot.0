From: Saurav Kumar Barik <sauravb@aztecsoft.com>
Date: Wed, 2 Jan 2008 20:06:46 +0530
Subject: [Buildroot] segmentation fault with sudo
Message-ID: <A1286843C9B74E46B0063D92B7844C2802DE7E21@azindbaex01.aztec.soft>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

I am getting segmentation fault with sudo.
I use Gatework's BSP 0.7 which I downloaded from
       http://bsp.gateworks.com

Searching in the mailing list archives I found with the uClibc-0.9.29
some of the packages (sudo, SMB etc) show segmentation fault when run.
Buildroot users have recommended downgrading uClibc to uClibc-0.9.28.3
version which solves the problem.

But I am not able to downgrade uClibc to 0.9.28.3 version because I use
the kernel version 2.6.21.4.
I tried to integrate uClibc-0.9.28.3 to my buildroot system but got a
lot of compilation errors.
Some of the files in uClibc-0.9.28.3 searches for "linux/version.h" file
which is not present in linux-2.6.21.4.

Has anybody successfully used sudo with Gatework's BSP 0.7
(linux-2.6.21.4)?
Please share some pointers.

Thanks & Regards,
Saurav


The information contained in, or attached to, this e-mail, contains confidential information and is intended solely for the use of the individual or entity to whom they are addressed and is subject to legal privilege. If you have received this e-mail in error you should notify the sender immediately by reply e-mail, delete the message from your system and notify your system manager. Please do not copy it for any purpose, or disclose its contents to any other person. The views or opinions presented in this e-mail are solely those of the author and do not necessarily represent those of the company. The recipient should check this e-mail and any attachments for the presence of viruses. The company accepts no liability for any damage caused, directly or indirectly, by any virus transmitted in this email.

www.aztecsoft.com
