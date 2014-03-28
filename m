From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 28 Mar 2014 10:51:30 +0100
Subject: [Buildroot] [PATCH] website: Add a Google+ presence
In-Reply-To: <87r45mg0lq.fsf@dell.be.48ers.dk>
References: <1395962911-309-1-git-send-email-maxime.hadjinlian@gmail.com>
 <87r45mg0lq.fsf@dell.be.48ers.dk>
Message-ID: <CAGduivy7GcoDETxOj9-pVN1ucYWeKgFzr887FqFBF75a2hsf1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 28, 2014 at 9:59 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:
>
>  > Since we use Google+ to share our news, this add a logo on the menu bar,
>  > which links to the Buildroot profile.
>
>  > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>  > ---
>  >  docs/header.html      |   5 +++++
>  >  docs/images/gplus.png | Bin 0 -> 4760 bytes
>  >  2 files changed, 5 insertions(+)
>  >  create mode 100644 docs/images/gplus.png
>
>  > diff --git a/docs/header.html b/docs/header.html
>  > index f64869f..4823488 100644
>  > --- a/docs/header.html
>  > +++ b/docs/header.html
>  > @@ -16,6 +16,10 @@
>  >        .button_column{
>  >          width: 430px;
>  >        }
>  > +      .gplus {
>  > +        float:right;
>  > +        margin: 10px 0 0;
>  > +      }
>  >      </style>
>
>  >      <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
>  > @@ -43,6 +47,7 @@
>  >                <li><a href="/contribute.html">Contribute</a></li>
>  >                <li><a href="/sponsors.html">Sponsors</a></li>
>  >              </ul>
>  > +            <a class="gplus" href="https://plus.google.com/communities/105232314127123366079"><img src="images/gplus.png" height="28" width="28"></a>
>
> Is that the right link? I don't see any of the recent posts like on:
>
> https://plus.google.com/100084591154899263420/posts
>
Arg, the link I used is the Buildroot community but we do all our
posts from the Buildroot account which are different.
It is a bad copy paste on my part, I intended to use the Buildroot account.

But maybe, we should use the community itself ?
I added Thomas P. on that matter, as he is the owner of both account.
> --
> Bye, Peter Korsgaard
