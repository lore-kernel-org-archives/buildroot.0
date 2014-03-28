From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 Mar 2014 09:59:29 +0100
Subject: [Buildroot] [PATCH] website: Add a Google+ presence
In-Reply-To: <1395962911-309-1-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Fri, 28 Mar 2014 00:28:31 +0100")
References: <1395962911-309-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87r45mg0lq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > Since we use Google+ to share our news, this add a logo on the menu bar,
 > which links to the Buildroot profile.

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > ---
 >  docs/header.html      |   5 +++++
 >  docs/images/gplus.png | Bin 0 -> 4760 bytes
 >  2 files changed, 5 insertions(+)
 >  create mode 100644 docs/images/gplus.png

 > diff --git a/docs/header.html b/docs/header.html
 > index f64869f..4823488 100644
 > --- a/docs/header.html
 > +++ b/docs/header.html
 > @@ -16,6 +16,10 @@
 >        .button_column{
 >          width: 430px;
 >        }
 > +      .gplus {
 > +        float:right;
 > +        margin: 10px 0 0;
 > +      }
 >      </style>
 
 >      <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
 > @@ -43,6 +47,7 @@
 >                <li><a href="/contribute.html">Contribute</a></li>
 >                <li><a href="/sponsors.html">Sponsors</a></li>
 >              </ul>
 > +            <a class="gplus" href="https://plus.google.com/communities/105232314127123366079"><img src="images/gplus.png" height="28" width="28"></a>

Is that the right link? I don't see any of the recent posts like on:

https://plus.google.com/100084591154899263420/posts

-- 
Bye, Peter Korsgaard
