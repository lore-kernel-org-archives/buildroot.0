From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 27 Aug 2018 06:23:55 -0700
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-08-26
In-Reply-To: <87ftz082x7.fsf@dell.be.48ers.dk>
References: <20180827060019.5834E20789@mail.bootlin.com>
 <CALURroSFJESgnrW-ErTQo-A7QhiupELvgsBveWTSOhddXT9UQg@mail.gmail.com>
 <87ftz082x7.fsf@dell.be.48ers.dk>
Message-ID: <CALURroR1KKg-cqL1WUJG0NzkZ=mKeZN_M_t3W76FAT4C7dTnug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 27, 2018 at 4:27 AM Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Christopher" == Christopher McCrory <chrismcc@gmail.com> writes:
>
> Hi,
>  > php compile breaks with:
>
>
<snip>


>  > --- a/package/php/Config.ext
>  > +++ b/package/php/Config.ext
>  > @@ -113,6 +113,7 @@ endif
>
>  >  config BR2_PACKAGE_PHP_EXT_MYSQLI
>  >         bool "Mysqli"
>  > +       select BR2_PACKAGE_PHP_EXT_HASH
>  >         help
>  >           MySQL Improved extension support
>
>  > fixes it on buildroot in the short term
>
> Great, care to send a real patch with your signed-off-by for this?
> Thanks!
>

Currently I don't have the best history with sending patches :) , but I
gave it a shot.




> --
> Bye, Peter Korsgaard
>


-- 
Christopher McCrory
To the optimist, the glass is half full.
To the pessimist, the glass is half empty.
To the engineer, the glass is twice as big as it needs to be.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180827/aba0adfe/attachment.html>
