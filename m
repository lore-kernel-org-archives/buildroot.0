From: David Skok <blanco.ether@gmail.com>
Date: Mon, 12 Aug 2013 14:36:19 -0400
Subject: [Buildroot] [PATCH 1/1] ola: new package
In-Reply-To: <20130812200108.3e03fc40@skate>
References: <1375881032-23901-1-git-send-email-blanco.ether@gmail.com>
 <20130810191316.7fd6fdbe@skate>
 <CALy4uEXhixrLNKzrRVsdYqCeNer6XPB_kXKwJepH8Pnh9+M+mA@mail.gmail.com>
 <20130812200108.3e03fc40@skate>
Message-ID: <CALy4uEXkhM0GFWZxnbUVBM_diEmU_jC35N6Y5zEM5GbERLq-0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Problem solved.  Details regarding source of problem are too
confounding to explain.  As it happens to be Simon Newton, the source
maintainer was about to release a new version within minutes of me
contacting him and we (he) was able to resolve it prior to the new
release.

Simon asked for and I provided him with details regarding how he can
verify that future development compiles under buildroot as he is aware
of and encourages Open lighting Architecture use in embedded
environments.  Again, thank you for your patience.  I am encouraged to
contribute more in the future where I can.

Dave



On Mon, Aug 12, 2013 at 2:01 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear David Skok,
>
> Please always keep the Buildroot mailing list Cc'ed when continuing
> discussions that started on the list.
>
> On Mon, 12 Aug 2013 08:26:57 -0400, David Skok wrote:
>
>> I've made the changes you point out.  My apologies but I don't know
>> what you mean by "patch is not wrapped" and is (is not?) proper
>> format.
>
> What I meant is that your latest patch was perfect.
>
> Often, when people send patches with their normal e-mail client, most
> e-mail clients tend to "wrap" lines at 80 characters or so: instead of
> having very very long lines, you have lines nicely wrapped at a
> reasonable length.
>
> However, while this is very useful when exchanging text, it falls apart
> when exchanging patches, because the wrapping feature of the e-mail
> clients breaks the patches and they can no longer be applied.
>
> By using 'git send-email' (as you did), you make sure that your e-mail
> client will not interfere with how the patch is sent, and specifically
> that it doesn't get wrapped.
>
>> I use git command line outlined in buildroot manual to send
>> it.  I am new to contributing to open source and am doing my best to
>> learn compliance for contribution.  Thank you for your patience so
>> far.
>>
>> Regarding the compile problem.  I have worked with the maintainer
>> previously while I was testing package to correct compile issues.  I
>> also test result with success.  The external compiler I used at the
>> time was linaro 2013.01 which was option in buildroot for ARM A8 then.
>>  I will verify error with configuration you report and find a solution
>> asap.
>
> I must say I haven't tested with a Linaro toolchain, which is glibc
> based, and I only tested with an uClibc based toolchain. However,
> seeing the message, I don't really suspect a glibc vs. uClibc
> difference.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
