From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 4 Jul 2016 00:07:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/libgpg-error: bump to version
	1.21
In-Reply-To: <1460790398.8200.4.camel@embedded.rocks>
References: <1451762923-15985-1-git-send-email-joerg.krause@embedded.rocks>
 <56885656.8080505@mind.be> <1458505707.1998.24.camel@embedded.rocks>
 <57113DC8.7090509@zacarias.com.ar> <1460790398.8200.4.camel@embedded.rocks>
Message-ID: <CAGduivyYS5BgoW=Ja80L+bexZnW9ocCNsUmQ_=XqZsDQ1b1AiQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jorg, all,

Thanks a lot for you patch, since upstream doesn't really appear to be
looking forward a solution, I have respinned it so we can merge it.
You can find it there: https://patchwork.ozlabs.org/patch/562100/

This patch will be marked as "Changes Requested", feel free to
continue the discussion if you want to add anything.

On Sat, Apr 16, 2016 at 9:06 AM, J?rg Krause
<joerg.krause@embedded.rocks> wrote:
> On Fr, 2016-04-15 at 16:15 -0300, Gustavo Zacarias wrote:
>> On 20/03/16 17:28, J?rg Krause wrote:
>>
>> > Hi Arnout,
>> >
>> > I'm really sorry for the long delay. This patch has lost my
>> > attention...
>> >
>> > >   It's mind-boggling that "a small library with error codes"
>> > > needs
>> > > architecture-specific handling...
>> >
>> > It is indeed! I had a closer look and I think the whole magic
>> > libgpg-
>> > error does for retrieving the initialization of a lock object can
>> > be
>> > done without all the target configuration files. I'll contact the
>> > maintainers about this issue.
>> >
>> > Best regards
>> > J?rg Krause
>>
>> Hi all.
>> A small attention note: this is now required for the recently
>> released
>> libgcrypt 1.7.0 since it depends on gpg-error >= 1.13 (which uses
>> the
>> new mutex code IIRC which causes this headache).
>> It's not a high-priority since it's just new feature, no security
>> bug
>> fixes... yet ;)
>> Regards.
>>
>
> I started a discussion with upstream [1] about this issue and proposed
> a patch [2] to fix the architucture dependends (which is none in my
> mind).
>
> Let's hope we can find a suitable solution...
>
> [1] http://comments.gmane.org/gmane.comp.encryption.gpg.devel/21150
> [2] http://comments.gmane.org/gmane.comp.encryption.gpg.devel/21176
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
