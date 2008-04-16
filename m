From: Hebbar <gururajakr@sanyo.co.in>
Date: Tue, 15 Apr 2008 17:02:13 -0700 (PDT)
Subject: [Buildroot] [PATCH] UBOOT: Provide Version selection option to
 user
In-Reply-To: <87skxna8zg.fsf@macbook.be.48ers.dk>
References: <16695022.post@talk.nabble.com>
	<87skxna8zg.fsf@macbook.be.48ers.dk>
Message-ID: <16713915.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,
Latest Gdb Version is Gdb 6.8 But we still have options starting at 6.4 in
buildroot.

option provided to build GDB 6.4 only to support AVR32
option provided for versions that support nios2.

   when bloats for atxx and avr32 can pushed all over buildroot, why cant a
general version support be provided which supports many others customized
boards..

  I think this is what is done for Busybox also. Even though Latest Busybox
version is 1.10.0 we still have few version options given going back to
1.7.x. 


Regards
Gururaja



>>
>>This doesn't apply to trunk - Uboot is now at v1.3.2.
>>
>>Why would you want a version selector here? Is something not working
>>in 1.3.2?

-- 
View this message in context: http://www.nabble.com/-PATCH--UBOOT%3A-Provide-Version-selection-option-to-user-tp16695022p16713915.html
Sent from the BuildRoot mailing list archive at Nabble.com.
