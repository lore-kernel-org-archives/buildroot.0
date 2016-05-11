From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 May 2016 12:40:58 +0200
Subject: [Buildroot] Backdoor in all Allwinner Linux kernels
In-Reply-To: <CA+TH9V=f1W6Gx6GPs3huF-_MtYzxetqq0bjq_4oriqyuUzXMJg@mail.gmail.com>
 (Angelo Compagnucci's message of "Wed, 11 May 2016 11:09:21 +0200")
References: <CA+TH9V=f1W6Gx6GPs3huF-_MtYzxetqq0bjq_4oriqyuUzXMJg@mail.gmail.com>
Message-ID: <87futokhc5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > http://forum.armbian.com/index.php/topic/1108-security-alert-for-allwinner-sun8i-h3a83th8/
 > Are we affected?

I believe not as this only affects the Allwinner kernel sources for the
newer SoCs, and we use the mainline kernel for our orangepi defconfig.

-- 
Bye, Peter Korsgaard
