From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 9 May 2014 11:25:37 +0000
Subject: [Buildroot] [PATCH v3] uboot-tools: bump to version 2014.04
In-Reply-To: <87y4yns2ar.fsf@dell.be.48ers.dk>
References: <1398840891-19524-1-git-send-email-abrodkin@synopsys.com>
 <877g67thh9.fsf@dell.be.48ers.dk> <1398842399.21385.2.camel@abrodkin-8560l>
 <87y4yns2ar.fsf@dell.be.48ers.dk>
Message-ID: <1399634736.3396.13.camel@abrodkin-8560l>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, 2014-04-30 at 09:29 +0200, Peter Korsgaard wrote:
> >>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:
> 
>  >> That's not true. They are flags for the preprocessor. You must be
>  >> confusing them with CXXFLAGS.
>  >> 
>  >> With that said, I think we're passing everything from HOST_CPPFLAGS
>  >> through HOST_CFLAGS as well, so it shouldn't matter.
> 
>  > Ok I think I did confused wit CXXFLAGS.
> 
>  > But I haven't found any mention of HOSTCPPFLAGS in current U-Boot so I'm
>  > wondering if we still need to add any handling of HOSTCPPFLAGS in U-Boot
>  > or there's nothing to be done?
> 
> No, I also don't see it used anywhere in u-boot nowadays, so the patch
> can get dropped.
> 
> I'll adjust the commit message when I commit (unless review finds other
> issues).
> 

This is just a kind reminder. If there're no objections is there a
chance to get this one applied?

Regards,
Alexey
