From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Nov 2013 10:10:20 -0300
Subject: [Buildroot] [PATCH 2/2] qemu/mips64-malta: switch to eglibc
In-Reply-To: <20131127140343.46e5f0e0@skate>
References: <1385513501-23157-1-git-send-email-gustavo@zacarias.com.ar>	<1385513501-23157-2-git-send-email-gustavo@zacarias.com.ar>	<20131127092443.0c6ea9b9@skate>	<5295C431.2010807@zacarias.com.ar>
 <20131127140343.46e5f0e0@skate>
Message-ID: <5295EF3C.70302@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/27/2013 10:03 AM, Thomas Petazzoni wrote:

> Ok. Then, should we make (e)glibc the default C library for mips64, so
> that users will not have a non-working system if they simply build a
> basic default configuration for mips64 (which will use uClibc) ?

Yes, i'll test other combinations (mips64 O32/N32/N64) to see what's
best for each scenario before sending a patch.
Regards.
