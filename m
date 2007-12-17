From: Michael Hunold <hunold@linuxtv.org>
Date: Mon, 17 Dec 2007 09:47:31 +0100
Subject: [Buildroot] error when building gcc using buildroot/toolchain
In-Reply-To: <20071211222816.GI17973@aon.at>
References: <3ed55890710300456o715fd332x1f5d8bf466a54882@mail.gmail.com>
	<14021271.post@talk.nabble.com> <475E8C8E.5090402@linuxtv.org>
	<20071211222816.GI17973@aon.at>
Message-ID: <476637A3.6010906@linuxtv.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernhard,

thanks for your answer and sorry for the delay from my side.

on 11.12.2007 23:28 Bernhard Fischer said the following:
> Michael, please send me (in private if you prefer) your br2.config and your
> uClibc.config so i can try to reproduce this error here.

I attached the two configs to this mail.

Please note that I did one modification to buildroot. I had to add back
the possibility to select 2.6.10 kernel again. I have not tried yet to
create buildroot against a later kernel, but I'll try now and let you
know the results.

> Please note that this doesn't look like it's really uClibc related but a
> buildroot issue.

I did not notice that the original post was sent to uclibc ML rather
than buildroot ML. I changed the CC now to the buildroot ML. Thanks for
the hint.

CU
Michael.
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: br2.config
Url: http://busybox.net/lists/buildroot/attachments/20071217/b5f84e90/attachment.diff 
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: uclibc.config
Url: http://busybox.net/lists/buildroot/attachments/20071217/b5f84e90/attachment-0001.diff 
