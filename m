From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 21:47:42 +0100
Subject: [Buildroot] Approaching 2014.11-rc1
In-Reply-To: <CA+sos79bohyvG8wCZKZbFOQyAG7Fo5+sUh1hS_8RJvYtG_yXwA@mail.gmail.com>
References: <20141026120700.79915afb@free-electrons.com>
 <CA+sos79bohyvG8wCZKZbFOQyAG7Fo5+sUh1hS_8RJvYtG_yXwA@mail.gmail.com>
Message-ID: <20141026214742.1a92dade@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Sun, 26 Oct 2014 21:21:17 +0100, Beno?t Th?baudeau wrote:

> There are many old pending patches that are in the 'new' state and
> waiting for replies. A lot of more recent patches have been replied to
> and even applied. What are the 'prioritization' rules here? What
> should be expected for these older patches?

There are no strict rules. However, recent patches tend to get more
attention I believe because it's quite certain that they still apply to
the latest Buildroot, and also because they are generally actively
being pushed. Also, some of the recent patches get quickly applied
because they don't raise any specific question, so we can just apply
them as is, without much discussion.

On the other hand, when a patch requires some discussion, or is not
clear, or requires some complicated testing, we tend to delay its
review/application, and therefore such patches tend to move
progressively toward the end of the queue.

When I look at patchwork, I try to look both at recent patches to
quickly reduce the length of the queue by applying the "easy" stuff,
but also to look at older patches that are generally more
"complicated" (if they were not "complicated", they would already have
been applied).

This is where help from others is welcome. If you see a patch in the
queue (even not a patch from you) that you believe is useful, do not
hesitate to test/review it and report about that. Or if needed: resend
a new version of this patch, updated for the latest Buildroot, after of
course testing it. This is the best way to help getting those older
patches applied.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
