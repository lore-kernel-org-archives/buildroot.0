From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Nov 2011 18:41:33 -0300
Subject: [Buildroot] [git commit branch/next] uClibc: fix sparc build
 breakage
In-Reply-To: <201111111533.42857.minimod@morethan.org>
References: <20111111211610.966C58F4EF@busybox.osuosl.org>
 <201111111533.42857.minimod@morethan.org>
Message-ID: <042cafdb4b6fcfe0c328677ff8a49625@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11.11.2011 18:33, Michael S. Zick wrote:

> Opens a question or two that did not get covered in the
> discussion about using a '-next' branch.
>
> A policy statement for when bug reports get cleared?
> When -next receives the patch?
> Just prior to when the current -next becomes the next -rc?
> (I think the second is the current policy.)

Yes the later is the common practice, hence the reason neither Peter 
nor I closed the bug.

> In the case of a patch that is submitted upstream and the
> additional month of committing patches (beginning in -next);
> The chance that 'upstream' will release a revised source
> before our -next becomes -rc is greater.

That depends, uClibc is a special case where we keep a couple of 
versions around.
Let's suppose version 0.9.33 gets out, then it'll most certainly be 
fixed, but if there's no 0.9.32.1 the patch will still apply to that 
tree.
Not every project around has a release schedule like buildroot so we 
probably need to be flexible about it.
Regards.
