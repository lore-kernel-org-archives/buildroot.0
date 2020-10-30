From: Michael Nosthoff <buildroot@heine.tech>
Date: Fri, 30 Oct 2020 08:53:18 +0100
Subject: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_package/libgpiod=3A_bump_versi?=
 =?utf-8?q?on_to_1=2E6?=
In-Reply-To: <CAMRc=MfTQ4o8TTV6UDR27dGBPqbUJA9EAFykdO0Rb3LDjp4Gkw@mail.gmail.com>
Message-ID: <57-5f9bc680-3-4a87f08@125885651>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
 
On Thursday, October 29, 2020 14:41 CET, Bartosz Golaszewski <brgl@bgdev.pl> wrote: 

> 
> v2.0 of libgpiod will no longer support older kernels but I'll support
> v1.6 indefinitely for older kernels and v1.4 as long as v5.4 is
> supported.

Will 1.4.x still work with 5.10 kernels? I guess the old API will just be deprecated for a while?

So I guess we have two possibilities going forward: 

- Use the version switch I proposed and even extend it when 2.0 and headers 5.10 are released
or
- Stay on the 1.4.x branch until linux 5.5 is the oldest supported version (if this is possible).

Regards,
Michael
