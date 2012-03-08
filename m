From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 8 Mar 2012 16:50:04 +0100
Subject: [Buildroot] [PATCH] apply-patches.sh: use series file to apply
 patches in proper order
In-Reply-To: <20120308140624.GC3429@ldesroches-Latitude-E6320>
References: <201202282119.38907.arnout@mind.be>
 <1331208055-18533-1-git-send-email-ludovic.desroches@atmel.com>
 <1331208055-18533-2-git-send-email-ludovic.desroches@atmel.com>
 <CAHXCMMJ6_MEK+WSHG1tezuO8_fANwW18dc_=Wq28dwMo1T1a3Q@mail.gmail.com>
 <20120308140624.GC3429@ldesroches-Latitude-E6320>
Message-ID: <CAHXCMMLOGDZ5g30OM+5dryn-5kAgtLeeB4R8UAYBfHW4VUC=MQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ludovic,

>> but i don't see how you handle disabled
>> patches in the series file, i means line starting by '#'?
>
> I didn't know that I could face such case so I didn't handle it.
>
> Is simply checking '#' presency at the beginning of the the patch name enough?
Afaik, yes.

See page 3: http://www.suse.de/~agruen/quilt.pdf


Regards,

Sam
