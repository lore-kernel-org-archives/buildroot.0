From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 13 Nov 2013 13:49:38 +0100
Subject: [Buildroot] [PATCH v2] infra: introduce github helper function
In-Reply-To: <5283737F.9090703@mind.be>
References: <1384345469-8967-1-git-send-email-mjonker@synopsys.com>
 <CAGduivx93_GbmnupCXxwnPXF_o-vGVnL+45WXUnXXdO+rf-Kng@mail.gmail.com>
 <5283737F.9090703@mind.be>
Message-ID: <CAGduivzFKB8oLGUCfyMunBtACJW9UeEtKweBBB8KLD0jdfiH0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 13, 2013 at 1:41 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 13/11/13 13:37, Maxime Hadjinlian wrote:
>>
>> Hi everyone,
>>
>> Thanks you Mischa for creating this patch.
>>
>> How about a dedicated URI scheme like
>> github://<username>/<package>/<version> instead of a call to a macro ?
>> I find it easier to remember, less error prone and maybe more user
>> friendly.
>
>
>  Easier to remember: maybe.
>
>  Less error prone: how so? Admittedly, with the call you won't get an error
> if you forget the third argument, but you will get an error if you forget
> e.g. the $(call ...) part.
>
>  However, the killer argument is: the implementation of this helper function
> is quite trivial, while the implementation of a github URL parser would be a
> lot more complicated.
You're right.
I don't how I managed that, but I totally missed the answer to my own
thread.
After reading the missed thread, I fully agree with what was said and
your arguments right here is, a trully a killer one.
No need to had clutter when it's not really needed.
>
>  Bottom line: I like it the way it is.
>
>  That said, feel free to post an alternative patch :-)
>
>
>  Regards,
>  Arnout
>
> [snip]
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
