From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Thu, 20 Dec 2007 13:33:38 +0200
Subject: [Buildroot] buildroot fail arm / arm_generic, on coreutils
In-Reply-To: <476A405E.9020909@gmx.net>
References: <4768F0A8.4090901@gmx.net>	<024701c8429e$6e24f180$3ba6fea9@atmel.com>
	<476A405E.9020909@gmx.net>
Message-ID: <476A5312.7090507@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>   
> 
>> This is because you built your cross compiler without WCHAR support.
> 
>   i enabled and disabled it already, made clean and another make, same
> error.

Does "make clean" cleans up your toolchain dir (toolchain_build_arm) - i'm sure it does not.


Regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
