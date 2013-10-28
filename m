From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Mon, 28 Oct 2013 09:22:19 -0500
Subject: [Buildroot] [PATCH 2/4] pkg-infra: introduce pre/post-step hooks
In-Reply-To: <867c8550-360d-40e7-96d1-9391ed121afc@email.android.com>
References: <a356a9112eac610a00a35e48fa9a04a81a460fe0.1382894622.git.yann.morin.1998@free.fr><cover.1382894622.git.yann.morin.1998@free.fr>
 <a89033d9a1639d8899191cae05b772b1646b6ddd.1382894622.git.yann.morin.1998@free.fr>
 <867c8550-360d-40e7-96d1-9391ed121afc@email.android.com>
Message-ID: <OFFE76B3E6.1D8A3AF3-ON86257C12.004EC5B6-86257C12.004EF1CF@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas D, Yann,

Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote on 10/27/2013 
04:40:09 PM:

> > 
################################################################################
> > 
> > 
################################################################################
> >+# Helper functions to catch start/end of each steps
> 
> each step
> 
> 
>+################################################################################
> >+
> >+# Those two functions are called by each steps below.
> 
> each step
> 
> >+# They are responsible for calling all hooks defined in $(STEP_HOOKS)
> 
> I personally find the name STEP_HOOKS pretty vague, if you don't know 
the
> context you have no clue what it could be. The other hooks POST_EXTRACT 
etc
> are clear from their name.
>
> Maybe, GLOBAL_INSTRUMENTATION_HOOKS?

But that is so long to type :)
 
Thanks,
-Ryan
