From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 5 Jan 2015 11:28:00 +0100
Subject: [Buildroot] [PATCH v4 00/17] ejabberd: XMPP server
In-Reply-To: <20150105000643.GG31970@free.fr>
References: <1418135662-773-1-git-send-email-johan.oudinet@gmail.com>
 <20150105000643.GG31970@free.fr>
Message-ID: <CAJtjsKb4i=9AJ8CcwJYDEvv1CDbCMddq8jDPP6F_BVaOyt40yw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

On Mon, Jan 5, 2015 at 1:06 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> On 2014-12-09 15:34 +0100, Johan Oudinet spake thusly:
>> Since ejabberd build system relies on rebar to download its dependencies, we've
>> packaged all of them separately and modified ejabberd makefile to not download
>> any dependency.
>>
>>  package/ejabberd/0001-remove-deps.patch            |  20 ++
>
> Shouldn't we call it erlang-ejabberd as it is an Erlang package using
> the rebar infrastructure?

I recall we agreed on erlang libraries should be named erlang-XXX but
not for erlang programs. I don't remember who said that but I think we
should call it ejabberd even though it's using the rebar
infrastructure.

>
> I've pushed my branch there:
>
>     git://git.busybox.net/~ymorin/git/buildroot yem/ejabberd
>
> for you to fetch.
>
> Not even build-tested, I lacked time tonight, will work on it tomorrow.

Ok. I've just fetched it and saw you've already fixed several things
pointed out by Thomas. I'm going to review your modifications and read
all emails I've received from you and Thomas during the week-end to
see what remains to be done.
Thanks to both of you.
-- 
Johan
