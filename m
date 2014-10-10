From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 10 Oct 2014 21:36:33 +0200
Subject: [Buildroot] [PATCH v3] package/mono: new package
In-Reply-To: <CA+TH9VkBYm1viE8=o9Miy8Pb4mGrmUxCdDJZ1rTncSysfbcPiA@mail.gmail.com>
References: <1412951017-6769-1-git-send-email-angelo.compagnucci@gmail.com>
 <20141010204840.4ec4d5d3@free-electrons.com>
 <CA+TH9VkBYm1viE8=o9Miy8Pb4mGrmUxCdDJZ1rTncSysfbcPiA@mail.gmail.com>
Message-ID: <CA+TH9V=qR-vBU+RHrzFj9KYqouzKnTgLZ4y+hUYOWkab6XS8hg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

>> I'm working on the patches that use a single mono package. There are
>> other issues with your patch: host-mono-managed automatically downloads
>> monolite, which is bad, as it circumvents the download infrastructure
>> of Buildroot. I'll show you an approach to fix that.

Another thing. I'm using this patch as a training to understand better
how to write good buildroot packages. I hope to contribute more in the
future! I really appreciate any hint and I prefer to write the patch
myself!
So I will be really grateful if you can review this patch and point me
to the right direction, step by step, if it's not to much a hassle for
you!

Again, thank you for your time!

>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
>
>
>
> --
> Profile: http://it.linkedin.com/in/compagnucciangelo



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
