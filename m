From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 May 2013 20:01:07 +0200
Subject: [Buildroot] [PATCH v7 01/10] libglib2: Bump libglib2 to 2.36.1
In-Reply-To: <20130522173035.GA14196@free.fr>
References: <1369177864-6236-1-git-send-email-spenser@gillilanding.com>
 <1369177864-6236-2-git-send-email-spenser@gillilanding.com>
 <20130522085552.7079aae2@skate>
 <CAEBucnA3xso9se45tc7EYb1zsPYTQnLk7WHjiKrowJFm7uqkkw@mail.gmail.com>
 <20130522173035.GA14196@free.fr>
Message-ID: <20130522200107.4cb83bfa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 22 May 2013 19:30:35 +0200, Yann E. MORIN wrote:

> > Case 1 is correct.  I was trying to make the patch bisect-able.  It's
> > possible that glibmm and glib-networking would fail to build if the
> > version is not consistent.
> 
> Thomas, that was me pointing out that bumping glib2, glibmm and
> glib-networking separately might be an error, and IIRC Spenser confirmed
> that with a test build (discussed on IRC some days ago).

Ok, thanks.

> Spenser, to avoid confusion in the future:
>   - add the relevant commenter as Cc: in the commit log,
>   - and add a little history to your patch commit log, like:
> 
>     blabla: do the foo
> 
>     Some explanations
>     possibly on
>     multiple lines
> 
>     Signed-off-by: you
>     Cc: someone
>     Cc: someone else
>     ---
>     v2 -> v3:
>       - fix this and that (someone else)
>     v1 -> v2:
>       - tweak this and that (someone)
> 
> So the reviewer know what has changed when you resend your patch(es).

Indeed. In this specific case, I believe a comment could be part of the
commit log itself, because it can be useful to preserve in the Git
history why the bump was made as a single commit.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
