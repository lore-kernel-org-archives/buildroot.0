From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Aug 2015 17:37:05 +0200
Subject: [Buildroot] [PATCH] website: make a symlink for the manual at
	the root of the website
In-Reply-To: <1440540002-13541-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 26 Aug 2015 00:00:02 +0200")
References: <1440540002-13541-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <877foixdr2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > This will give us a shorter URL, that we can mor eeasily refer to in the
 > documetation itself, in help texts, on IRC...

 > Suggested-by: Arnout Vandecappelle <arnout@mind.be>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>
 > ---
 >  docs/website/contribute.html    |  2 +-
 >  docs/website/docs.html          |  2 +-
 >  docs/website/manual.html        |  1 +
 >  package/Config.in               | 23 +++++++++++------------
 >  package/rpi-firmware/config.txt |  2 +-
 >  5 files changed, 15 insertions(+), 15 deletions(-)
 >  create mode 120000 docs/website/manual.html

 > diff --git a/docs/website/contribute.html b/docs/website/contribute.html
 > index 17ed26f..d048c47 100644
 > --- a/docs/website/contribute.html
 > +++ b/docs/website/contribute.html
 > @@ -26,7 +26,7 @@ There are many different ways to contribute:</p>
 >  </ul>
 
 >  <p>For more details on these topics, check out the
 > -<a href="http://buildroot.uclibc.org/downloads/manual/manual.html#_contributing_to_buildroot">
 > +<a href="http://buildroot.uclibc.org/manual.html#_contributing_to_buildroot">

We use buildroot.org instead of the legacy .uclibc.org elsewhere, so
I've fixed that and committed, thanks.

-- 
Bye, Peter Korsgaard
