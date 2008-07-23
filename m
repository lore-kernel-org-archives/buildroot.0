From: Nathanael D. Noblet <nathanael@gnat.ca>
Date: Wed, 23 Jul 2008 09:36:15 -0600
Subject: [Buildroot] Openssl won't compile
In-Reply-To: <20080723133519.GA27147@cloud.net.au>
References: <4886A1F4.1010900@gnat.ca> <20080723133519.GA27147@cloud.net.au>
Message-ID: <48874FEF.9070208@gnat.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hamish Moffatt wrote:
> On Tue, Jul 22, 2008 at 09:13:56PM -0600, Nathanael D. Noblet wrote:
>> Hello,
>>    Anyone experience difficulty compiling openssl (0.9.7m)? I get a 
>> missing sys/timeb.h, upgrading to ssl 0.9.8g) is no better as the 
>> patches don't apply and I'm not sure what the ones I couldn't fix were 
>> doing.
>>
>>    For what it is worth, I'm using gcc-3.1 and a daily snapshot of uclibc.
> 
> I'm not having any trouble building it for armeb with gcc 4.1.2 with
> uClibc 0.9.29.

Using 0.9.29 I can't boot my target device. The rootfs boots in qemu but 
I get a general protection fault on the real hardware. I've tried 4.2.x 
and 4.3 and 4.4. Perhaps I'll try 4.1.2....


-- 
Nathanael d. Noblet
Gnat Solutions, Inc
T: 403.875.4613
