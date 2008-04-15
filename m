From: Tiju Jacob <jacob_tiju@yahoo.com>
Date: Tue, 15 Apr 2008 18:14:54 +0530 (IST)
Subject: [Buildroot] Mount_filesystem_s3c2440
Message-ID: <954112.89191.qm@web94114.mail.in2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Joe,

In target/generic/device_table.txt, I added the lines
/dev/ttySAC c   666 0   0   204 5   0   1   3

Verified that the ttySAC0 is present in dev/ .But still the output remains the same.

registered taskstats version 1
Freeing init memory: 1032K
Can't open /dev/ttySAC0: No such device or address
Can't open /dev/ttySAC0: No such device or address
Can't open /dev/ttySAC0: No such device or address                                                            

I dont know weather the major and minor numbers are correct or wrong. How can I find out that? Where do I get more information regarding this?

Thanks in advance.
Tiju





      Check out the all-new face of Yahoo! India. Go to http://in.yahoo.com/
