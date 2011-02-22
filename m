From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Feb 2011 10:05:58 +0100
Subject: [Buildroot] rebuilding u-boot
In-Reply-To: <AANLkTim69LmQk8O7Evg9Tb4f9yOS6KRb7L_5VXCQTZbo@mail.gmail.com>
	(Charles Krinke's message of "Mon, 21 Feb 2011 17:31:43 -0800")
References: <AANLkTim69LmQk8O7Evg9Tb4f9yOS6KRb7L_5VXCQTZbo@mail.gmail.com>
Message-ID: <87y658qw09.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Charles" == Charles Krinke <charles.krinke@gmail.com> writes:

 Charles> I figured out how to rebuild uImage after reviewing the instructions. To help
 Charles> others, it involves removing the file ".stamp_compiled" from the top of the
 Charles> linux kernel tree in output/build/linux-xxx/

 Charles> But, ... there is no corresponding ".stamp_compiled" in output/build/
 Charles> u-boot-2010.06/

 Charles> So, .... how does one go about rebuilding u-boot?

rm output/build/u-boot-*/u-boot.bin

-- 
Bye, Peter Korsgaard
