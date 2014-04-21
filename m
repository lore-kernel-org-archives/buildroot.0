From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Apr 2014 12:04:01 -0300
Subject: [Buildroot] [PATCH 5/6] temporary hack to fix linking error
In-Reply-To: <1397382423-4939-6-git-send-email-wbx@openadk.org>
References: <1397382423-4939-1-git-send-email-wbx@openadk.org>
 <1397382423-4939-6-git-send-email-wbx@openadk.org>
Message-ID: <53553361.80008@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/13/2014 06:47 AM, Waldemar Brodkorb wrote:

> See here for more info:
> https://sourceware.org/ml/libc-help/2014-04/msg00020.html
> 
> Still working on the issue.

This patch works, but by it being temporary/hacky it should be
conditionally applied just for microblaze since you probably have no
idea how it can affect other architectures.

By the way, how is it that we're not interested in fixing things or
something like that?
(https://sourceware.org/ml/libc-help/2014-04/msg00027.html)
I'm using my (volunteer/spare) time looking at your patchset and testing
it, so i think that's not a fair assessment, and disabling eglibc
because "no time to test" and saying that at the same time sounds pretty
much like double-standards.
I'm not saying this to get you angry or anything like that, it's just
that you're stating it in a very public mailing list and it seems
utterly unfair to many BR contributors. Many people do what they can
when they can.

Now with that out of the way, care to respin this patch with the
consideration i mentioned above?
Regards.
