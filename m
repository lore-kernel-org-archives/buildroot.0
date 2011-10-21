From: Will Wagner <will_wagner@carallon.com>
Date: Fri, 21 Oct 2011 15:33:30 +0100
Subject: [Buildroot] [RFC] Slides "Using Buildroot for real projects"
In-Reply-To: <20111021154303.43f98ccd@skate>
References: <20111017184718.71afc290@skate> <20111021154303.43f98ccd@skate>
Message-ID: <4EA182BA.2050400@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/10/2011 14:43, Thomas Petazzoni wrote:
> Le Mon, 17 Oct 2011 18:47:18 +0200,
> Thomas Petazzoni<thomas.petazzoni@free-electrons.com>  a ?crit :
>
>> The current (unfinished) status of my slides is visible at:
>>    http://free-electrons.com/~thomas/pub/using-buildroot-real-project.pdf
<snip>
> Now, if you're still willing to spend some time on this, I'd like to
> have comments on:
>   * remaining english typos, wording improvements, etc.

Couple of minor points on the English (Still very impressive from a non 
native speaker)
p8: "Buildroot starts by the toolchain" should be "starts with the"
p16 "Any other project specific file" should perhaps be "files"
p17: "kernel and bootloaders often" shouldn't it be singular bootloader?
p17: "drawback is that Buildroot does directly" unless I misunderstand 
the use case, don't you mean doesn't?
p21: "I don't recommend this, ..." I'm not sure if you are not 
recommending changing the skeleton or using a script to modify it
p30: "finds automagically" should be "automagically finds"
p37: "assignements" should be assignments
p37: "allows to tell" should be "allows you to tell"

>   * suggestions of additional contents/topics if there is something I
>     missed. Like if you use best practices that aren't described in
>     those slides.

One thing I'd love to get written up somewhere is best practice for NFS 
mounting a filesystem image, but I realise this may not be relevant to 
your talk.

Otherwise your slides are very good at explaining how it all works.

Will
