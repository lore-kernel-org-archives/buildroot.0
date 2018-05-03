From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 14:13:12 +0200
Subject: [Buildroot] [PATCH v5 2/9] gst1-plugins-${base, good, bad,
 ugly}: bump to 1.14.0
In-Reply-To: <CAFSsvmqjoFRCCC5+w3f9X7HCOATyFhWCE2tzL4Xpi2kB=f04Sw@mail.gmail.com>
References: <20180501134651.8876-1-aduskett@gmail.com>
 <20180501134651.8876-2-aduskett@gmail.com>
 <20180501224907.14e84163@windsurf.home>
 <CAFSsvmqjoFRCCC5+w3f9X7HCOATyFhWCE2tzL4Xpi2kB=f04Sw@mail.gmail.com>
Message-ID: <20180503141312.6c4b592e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 02 May 2018 21:12:54 +0000, Adam Duskett wrote:

> > There are two issues with this patch:  
> 
> >   - You remove/rename a lot of options, but there is no Config.in.legacy
> >     handling for the options being removed/renamed.  
> 
> >   - The lame and mpg123 support is moved from plugins-ugly to
> >     plugins-good, but the corresponding options are not removed from
> >     plugins-ugly/Config.in.  
> 
> > Could you fix those issues, re-adjust the authorship for PATCH
> > 8/9 (you can do that with git commit --amend --author="..."), and send
> > an updated version of this patch series ?  
>
> I am going to have to decline. I really don't want to sit here through
> possibly several more revisions of the patch series.
> I have marked the series as rejected and anybody else is free to resubmit
> if they want.

I'm not sure I understand your decision here. There are a few things
that are obviously wrong in this v5 (lack of Config.in.legacy
handling), which are trivial to fix, and just for that reason, you give
up on the series ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
