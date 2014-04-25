From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Apr 2014 09:16:34 +0200
Subject: [Buildroot] [PATCH 1/2] smack: new package.
In-Reply-To: <87ha5i1o45.fsf@dell.be.48ers.dk>
References: <1398020044-21021-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1398020044-21021-2-git-send-email-eric.le.bihan.dev@free.fr>
 <20140421121901.743513ef@skate> <20140421115606.GA4082@milhouse>
 <20140421135542.26258821@skate>
 <349b40e5-c2f3-4b82-97dd-5f18e5638d24@email.android.com>
 <87ha5i1o45.fsf@dell.be.48ers.dk>
Message-ID: <20140425091634.44faa70d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Thu, 24 Apr 2014 22:14:34 +0200, Peter Korsgaard wrote:

>  >> While reviewing these packages, I was indeed thinking of writing a
>  >> "package addition check list" for the manual. But I'm wondering if this
>  >> wouldn't replicate quite a lot of informations already in the manual,
>  >> though it's true the idea of testing with some specific toolchain
>  >> configurations isn't written anywhere.
> 
>  > I certainly think a checklist would be a good addition to the
>  > manual. The checklist would not contain details, but only references
>  > to other parts of the manual.
> 
>  > Adding a list of toolchain configurations to test packages with is
>  > also on my todo list but I haven't gotten around these improvements
>  > yet...
> 
> Perhaps we need something like checkpatch.pl to test a package with the
> various toolchain combinations?

That could work with the packages that don't have crazy dependencies.
But as soon as the package starts depending on OpenGL or things like
that, it would be more difficult I believe.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
