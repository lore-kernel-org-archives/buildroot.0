From: Ron Eggler <reggler@semios.com>
Date: Tue, 17 Dec 2013 21:50:50 +0000
Subject: [Buildroot] generate uImage file
Message-ID: <1651747.2nkJEYoDym@regdesktophome>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I just changed my buildroot config to generate a uImage file. I then did a "make clean" 
followed by a make but for both I get:
linux/linux.mk:339: *** No kernel configuration file specified, check your 
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE setting.  Stop.

What does this mean? How do I fix this to compile again?

Thank you,
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131217/63e8d3e6/attachment-0001.html>
