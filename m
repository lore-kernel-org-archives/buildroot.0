From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Aug 2016 19:15:12 -0700
Subject: [Buildroot] dri2.h needed but missing
In-Reply-To: <trinity-c313bacc-e685-4046-81aa-0a8a97915dc9-1470338357069@3capp-mailcom-bs11>
References: <trinity-c313bacc-e685-4046-81aa-0a8a97915dc9-1470338357069@3capp-mailcom-bs11>
Message-ID: <4b622cd4-fa9d-1b6b-9d33-7c7397800ce1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 8/4/16 12:19 PM, daggs wrote:
> Greetings,
> 
> I need the file mentioned above for a package I want to add, I cannot seem to find it under xorg's installed headers, any idea why and how I can add it?
>

you need to depend on xserver-xorg

> Thanks,
> 
> Dagg.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
