From: Axel Lin <axel.lin@ingics.com>
Date: Thu, 9 Jan 2014 11:02:25 +0800
Subject: [Buildroot] [PATCH] cryptsetup: Link against -lrt for
	clock_gettime
In-Reply-To: <OF2E6B5209.C0B8B95C-ON86257C5A.006542A1-86257C5A.00655EBD@rockwellcollins.com>
References: <1389115451-4096-1-git-send-email-Vincent.Riera@imgtec.com>
 <OF00B93CC6.8A6EB2A8-ON86257C5A.0052E7B2-86257C5A.00538718@rockwellcollins.com>
 <52CD7B62.6000106@zacarias.com.ar>
 <OF2E6B5209.C0B8B95C-ON86257C5A.006542A1-86257C5A.00655EBD@rockwellcollins.com>
Message-ID: <CAFRkauA8_kLc9ODt_iS0s5YqqrGfeV3sbyChWkhvGPrQphOC_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014/1/9 Clayton Shotwell <clshotwe@rockwellcollins.com>:
> Gustavo,
>
> Gustavo Zacarias <gustavo@zacarias.com.ar> wrote on 01/08/2014 10:22:58
> AM:
>
>> Hi, take a look at packages/linux-pam/linux-pam-04-mkdir.patch maybe
>> it's the same problem? (very old bundled gettext).
>> Regards.
>
> That is the same problem exactly.  Thanks for pointing that out.
>
> Vicente,
>
> Would you be able to incorporate that patch into your submission for
> fixing cryptsetup?

Hi,

I can send a fix for this now.
I tried to fix it a few days ago, but then got interrupted by my real job.
Sorry for the delay.
And thanks for providing the fix to address po make error.

Regards,
Axel
