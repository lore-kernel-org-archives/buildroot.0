From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 29 Apr 2014 20:04:22 +0200
Subject: [Buildroot] [PATCH] samba4: disable for avr32
In-Reply-To: <1398775238-9054-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 29 Apr 2014 09:40:38 -0300")
References: <1398775238-9054-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8761lsui55.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > The toolchain is not up to the task, fixes:
 > http://autobuild.buildroot.net/results/21f/21f5fd1fc8415abff1d1178843586956ef1fd1e3/
 > Also AVR32s are low on resources (RAM, no proper storage port, most of
 > them short of flash) to handle it.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
