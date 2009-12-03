From: Stefan Schake <caytchen@gmail.com>
Date: Thu, 3 Dec 2009 15:04:07 +0100
Subject: [Buildroot] iconv conversion issues on target
In-Reply-To: <e4b6ec780912030602h418c4960ld762c9e9b7dcb6b0@mail.gmail.com>
References: <e4b6ec780912030602h418c4960ld762c9e9b7dcb6b0@mail.gmail.com>
Message-ID: <e4b6ec780912030604w6901c817obf1537479a42042b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just to add, this is a completely clean build; e.g. I deleted output/
and make ran through without any problems.

2009/12/3 Stefan Schake <caytchen@gmail.com>:
> Hey,
>
> When running mplayer on the target, I get alot of "iconv: conversion
> from US-ASCII to ASCII unsupported" messages. This is not limited to
> mplayer though, I get the same when running programs dependent on glib
> for example, "GLib: Cannot convert message: Could not open converter
> from 'UTF-8' to 'ASCII'".
> I have attached my buildroot config and the output of iconv -l from
> target, hopefully somebody can tell me what went wrong here :)
>
> Greetings
>
