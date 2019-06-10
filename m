From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 10 Jun 2019 19:02:58 +0200
Subject: [Buildroot] [Lua 0/2] Lua modules removal
In-Reply-To: <1994ec5b-511f-2314-d54b-6ec18bc63a74@mind.be>
References: <20190608211827.7731-1-francois.perrad@gadz.org>
 <cb9f5645-6484-7ccc-ca81-3e79ccb51a9d@mind.be>
 <CAB0FRsv_L8kG_g5uXdd=80WJptzRFvZ1EFpSwuS3A8P5Xu1-6A@mail.gmail.com>
 <1994ec5b-511f-2314-d54b-6ec18bc63a74@mind.be>
Message-ID: <CAB0FRsuz74nnfJsOwmLZ6CyXN32S3E3fM4FhAqo4LpZ8i5Q4mw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lun. 10 juin 2019 ? 15:17, Arnout Vandecappelle <arnout@mind.be> a
?crit :

>
>
> On 10/06/2019 10:31, Fran?ois Perrad wrote:
> >
> >
> > Le dim. 9 juin 2019 ? 22:37, Arnout Vandecappelle <arnout@mind.be
> > <mailto:arnout@mind.be>> a ?crit :
> >
> >
> >
> >     On 08/06/2019 23:18, Francois Perrad wrote:
> >     > This serie removes 2 Lua modules which are Lua 5.1 only
> >     > and not actively maintained by upstream.
> >
> >      This needs a bit more context though... Is the intention to remove
> Lua 5.1? And
> >     what about luajit?
> >
> >
> > This is a step in order to remove Lua 5.1, but not LuaJIT which stay as
> is.
>
>  So, aren't these two packages relevant for LuaJIT then?
>
>
These two modules could be loaded/used by LuaJIT, but in practice, I don't
think they are.

Fran?ois


>  Regards,
>  Arnout
>
> > In otherways, Lua evolves :
> > - Lua 5.3.5 will be the last one of its serie
> > - Lua 5.4 is up coming (lua-5.4.0-alpha is already available)
> > - Lua 5.2.4 was released on 2015
> > - Lua 5.1.5 was released on 2012.
> >
> > Lua has two sides :
> > - an interpreter which could be used with various modules
> > - a library used as optional dependency
> > This serie handles only the interpreter side.
> >
> > Fran?ois
> >
> >      We tend to not remove unmaintained packages unless there is a good
> reason
> >     for it.
> >
> >      Regards,
> >      Arnout
> >     _______________________________________________
> >     buildroot mailing list
> >     buildroot at busybox.net <mailto:buildroot@busybox.net>
> >     http://lists.busybox.net/mailman/listinfo/buildroot
> >
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190610/65dd322d/attachment.html>
