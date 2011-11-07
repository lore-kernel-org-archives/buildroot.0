From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2011 13:25:48 +0100
Subject: [Buildroot] Report from the Buildroot Developer Day
In-Reply-To: <20111107120936.GA26160@merkur.ravnborg.org>
References: <20111102160349.4afe5935@skate>
 <CAAXf6LV8pXKtNqU5oey_yikX_7YMLLVJpd9aE9SpyCgiuCC7zw@mail.gmail.com>
 <20111107120936.GA26160@merkur.ravnborg.org>
Message-ID: <20111107132548.33965b56@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 7 Nov 2011 13:09:36 +0100,
Sam Ravnborg <sam@ravnborg.org> a ?crit :

> The tags seems to be used in different ways. The way I have understood
> their usage - and thus the way I have used them is like this:
> 
> Acked-by is used when I think that a patch does the right thing.
> For example when it introduces a a new feature or change something -
> and which I consider it the right thing to do.
> 
> Reviewed-by is stronger in the sense that I have actually taking my
> time to carefully read the patch line-by-line and that I consider
> that the patch is correct.
> I almost never use "Reviewed-by" for patches touching code areas
> that I am not familiar with - as I do not know if they are correct.
> Reviewed-by includes an implicit Acked-by as I would not spend time
> to review something if I did not agree on the patch.

Interestingly, my understanding is more or less the opposite of yours.
For me:

 * Reviewed-by means that you have read the patch and agree with its
   principle and general implementation, but not that you have actually
   tested and verified that the patch works. The top-level maintainer
   will have to do additional testing because you haven't done so.

 * Acked-by is much stronger, as it means that you fully agree with the
   patch, that you reviewed it *and* tested it, and that the top-level
   maintainer does not necessarily need to do additional testing if he
   trusts you, because Acked-by means that you have actually tested
   this.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
