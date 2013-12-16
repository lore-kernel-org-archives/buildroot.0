From: Ron Eggler <reggler@semios.com>
Date: Mon, 16 Dec 2013 01:52:44 +0000
Subject: [Buildroot] build uboot for AT91SAM9G20
Message-ID: <3487466.tnqfWxcGWT@regdesktophome>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm relatively new to buildroot, thus please excuse my beginner question.
I have configured buildroot to build an image for my AT91SAM9G20 system. I believe it has 
built just fine but I'm running into an issue when it comes to uboot, I'm getting this:
...
make[1]: Entering directory `/etc/E10-buildroot/br2013.11/output/build/uboot-2013.10'
make: *** No rule to make target `e10_config'.  Stop.
make[1]: *** [e10_config] Error 1
make[1]: Leaving directory `/etc/E10-buildroot/br2013.11/output/build/uboot-2013.10'
make: *** [/etc/E10-buildroot/br2013.11/output/build/uboot-2013.10/.stamp_configured] 
Error 2
# 

how can I get buildroot to properly compile uboot for my AT91SAM9G20?

Thanks,
Ron
-- 
*ron eggler | semios | senior software engineer*
320 - 887 Great Northern Way | Vancouver, BC | V5T 4T5
T | 604 229 2044 ext 105[1]
C | 778 230 9442[2]
E | reggler at semios.com[3]
smart farming[4]
twitter[5] linkedin[6]

--------
[1] tel:604%20229%202044%20ext%20105
[2] tel:778%20230%209442
[3] mailto:reggler at semios.com
[4] http://www.semios.com
[5] https://twitter.com/semios
[6] http://www.linkedin.com/company/semiosbio-technologies-inc?goback=%2Enmp_*1_*1_*1_*1_*1_*1_*1_*1_*1_*1&trk=company_logo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131216/f22bd984/attachment.html>
