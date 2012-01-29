From: Diego Iastrubni <diegoiast@gmail.com>
Date: Sun, 29 Jan 2012 18:08:09 +0200
Subject: [Buildroot] [RFC 14/15] foobar: create a fake proprietary
 package (testing only)
In-Reply-To: <201201290950.27997.minimod@morethan.org>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
 <1327849908-15588-15-git-send-email-luca@lucaceresoli.net>
 <CALR4fELbaToSJw6qJHWJ=hF8TBA4gMsN49eTaiESt+PJRytoUA@mail.gmail.com>
 <201201290950.27997.minimod@morethan.org>
Message-ID: <CALR4fEKdhTWZfcbNYjWWEPFiOuSoBCmJxYMFAB=2THO4pwQzgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael,

I think both of us forgot to take the funny pill today.

I always get confused, is it the blue pill.. or red pill...? :)

On Sun, Jan 29, 2012 at 5:50 PM, Michael S. Zick <minimod@morethan.org> wrote:
> On Sun January 29 2012, Diego Iastrubni wrote:
>> On Sun, Jan 29, 2012 at 5:11 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
>> >
>> > This is only for testing the proprietary package handling, not to be
>> > committed in any serious repository.
>> >
>> > +FOOBAR_LICENSE = PROPRIETARY
>> >
>> > +++ b/package/foobar/source/foobar.c
>> > @@ -0,0 +1,7 @@
>> > +#include <stdlib.h>
>> > +
>> > +int main(void)
>> > +{
>> > + ?printf("Hello, World!\n");
>> > + ?return 0;
>> > +}
>>
>>
>> <sarcasm>
>> OMG OMG... buildroot is forking into a?proprietary?applications DB...
>> where is ./ where we need them?
>> </sarcasm>
>>
>
> Perhaps you missed the recently added support for closed source
> binary firmware blobs?
>
> <sarcasm>
> Your panic threshold setting may have to be tweaked up a bit.
> </sarcasm>
>
> If this proposal or something like it is included in the build
> system, then those firmware blob licenses could also be handled
> with the new bit of infrastructure.
>
> Mike
>> /me takes a cup of water and relaxes... ;-)
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
