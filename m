From: Lionel Orry <lionel.orry@gmail.com>
Date: Fri, 21 Sep 2012 16:30:05 +0200
Subject: [Buildroot] [PATCH] unionfs: add missing dependency on
	host-pkg-config
In-Reply-To: <505C792E.5000509@zacarias.com.ar>
References: <1348224356-20104-1-git-send-email-arnout@mind.be>
 <505C4969.8090707@zacarias.com.ar> <505C4C17.2000701@mind.be>
 <505C4DB3.8000008@zacarias.com.ar> <505C4E1A.7000809@mind.be>
 <505C5180.10105@zacarias.com.ar> <505C597E.8020306@mind.be>
 <877grn790t.fsf@macbook.be.48ers.dk>
 <505C792E.5000509@zacarias.com.ar>
Message-ID: <CAKAx1chXnkb=OOQM=giNnqLZ4taE1qV7cLtU59pWqFG1YrOUJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 21, 2012 at 4:26 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> On 09/21/12 11:20, Peter Korsgaard wrote:
>
>> That's an option, but it's fairly slow to build (mainly because of the
>> embedded glib), so people might not like it (especially if using an
>> external toolchain). Perhaps it would be better to move to pkgconf
>> instead then (I think Gentoo uses it)?
>>
>> https://github.com/pkgconf/pkgconf
>
> It's not a default in Gentoo yet, though it's available.
> Anybody run some tests switching to it?
> Regards.

Funtoo Linux (gentoo-based) uses pkgconf as default now :
http://jira.funtoo.org/browse/FL-15
I think this switch is quite safe and you can trust Funtoo maintainers...

My 2 cents
Lionel

>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
