From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Aug 2017 14:31:16 +0200
Subject: [Buildroot] [PATCH] bcusdk: enable tpuarts support in eibd
In-Reply-To: <20170825071511.GA18332@airbook.vandijck-laurijssen.be>
References: <20170824073008.GB22055@airbook.vandijck-laurijssen.be>
 <20170824231135.4a4a8e98@windsurf>
 <20170825071511.GA18332@airbook.vandijck-laurijssen.be>
Message-ID: <20170825143116.52906566@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 25 Aug 2017 09:15:11 +0200, Kurt Van Dijck wrote:
> >  - Could you use "git send-email" next time to send your patch? Indeed
> >    the formatting of your patch was not correct, so I had to fix it up
> >    manually. I.e you shouldn't be adding a "personal" message at the
> >    top of the patch, but just e-mail out the output of "git
> >    format-patch", which is exactly what "git send-email" guarantees to
> >    do correctly.  
> 
> Well, there has not been much reason to change, but since you're asking,
> I'll give it a try.

Well, your e-mail contained the personal message at the top, which gets
included in the commit log by git when doing "git am". If you want to
include personal messages, put them below a "---" at the end of the
commit log.

> >  - I've added to the commit log some information about the size
> >    increase caused by this new option. Since it's just 8 KB, it doesn't
> >    justify adding a new Buildroot Config.in option.  
> 
> I didn't understand why the different backends didn't have config options.
> Now I know.

Well, it's all a matter of whether it makes sense to add gazillions of
Buildroot options. For 8 KB of additional size, it doesn't make much
sense.

> This basically implies this has been unmaintained for a while, which
> explains a few things.
> Well, I think that it's good idea I start to take care for the package,
> as I'm indeed using it.
> Will you add my name in the DEVELOPERS file, or do I need to take action
> myself?

Please send a patch that adds yourself to the DEVELOPERS file for this
package. Thanks a lot for adopting it!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
