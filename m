From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Feb 2016 21:27:19 -0300
Subject: [Buildroot] [PATCH 1/3] vala: add vala/valac wrapper
In-Reply-To: <56CB9E4B.20004@mind.be>
References: <1454428908-7183-1-git-send-email-gustavo@zacarias.com.ar>
 <56CB9E4B.20004@mind.be>
Message-ID: <56CBA767.80008@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/02/16 20:48, Arnout Vandecappelle wrote:

>> +#!/bin/sh
>> +$0- at VALA_VERSION@ --vapidir=@STAGING_DIR@/usr/share/vala/vapi --girdir=@STAGING_DIR@/usr/share/gir-1.0 $@
>
>   This makes it non-relocatable. Instead, just use the ${STAGING_DIR} that is
> passed in the environment. That means you can't use vala/c outside of buildroot,
> but I don't think that's an issue, right?

Hi.
Not more so than the pkg-config wrapper or the toolchain wrapper, which 
i can bet is more used/important than this one.
Regards.
