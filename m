From: Jaap Crezee <jaap@jcz.nl>
Date: Sat, 11 Jun 2016 12:40:36 +0200
Subject: [Buildroot] host-lzop failing when host is using gcc-6
In-Reply-To: <87twhn9pqx.fsf@dell.be.48ers.dk>
References: <ba2ba1aa-3774-89b9-f8bf-270bc3ebac78@jcz.nl>
 <87twhn9pqx.fsf@dell.be.48ers.dk>
Message-ID: <0430753f-9aaf-fcef-90ee-35088009b670@jcz.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,


On 05/24/16 22:15, Peter Korsgaard wrote:
>>>>>> "Jaap" == Jaap Crezee <jaap@jcz.nl> writes:
> 
>  > Hi all,
>  > host-lzop seems to be failing when Archlinux switched to gcc-6.x
>  > recently. One can see the attached logfile. Anybody willing to
>  > investigate? I don't have time at the moment.
>  > HOSTCC=gcc-4.8 bypasses the issue for me...
>
> This sounds like this:
> 
> http://patchwork.openembedded.org/patch/122249/
> https://build.opensuse.org/package/view_file/Archiving/lzop/lzop-1.03-gcc6.patch?expand=1

I used that patch and tweaked it a little to allow patching from buildroot.
It works flawlessley on my Archlinux gcc-6.1.1 box.

regards,


Jaap
