From: Andrew Wiley <debio264@gmail.com>
Date: Mon, 23 Feb 2009 19:58:51 -0600
Subject: [Buildroot] Fwd:  I apologize for asking...
In-Reply-To: <ecbbfeda0902231758o3ffdf662sb828a8bf97f8d6b4@mail.gmail.com>
References: <49A351CE.3000705@comcast.net>
	<ecbbfeda0902231758o3ffdf662sb828a8bf97f8d6b4@mail.gmail.com>
Message-ID: <ecbbfeda0902231758w66917b7fx56341ea244ac2dcd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
>
> So here's the crazy question from the new novice! Where and how do I set
> this "*unset CFLAGS*". I'm asking because I really don't want to make any
> mistakes here. I've looked through the configuration files, and either
> haven't seen it, or it's just not there. Now maybe you also need to know
> this as well. I'm attempting to build this "On and For" x86_64. So the
> target and build host are the same architecture. If anyone else has done
> this, and knows it to be problematic, please let me know.
>

You literally run `unset CFLAGS` before you run `make` or whatever command
you're using to get that output. Your linux distribution is setting that
environment variable, and Buildroot needs to set it to something else.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090223/e598d784/attachment-0001.htm>
