From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Mar 2015 17:32:22 +0100
Subject: [Buildroot] [PATCH] website: add link to the release archive
In-Reply-To: <1426067061-12275-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Wed, 11 Mar 2015 10:44:21 +0100")
References: <1426067061-12275-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87y4n3lckp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > We have them, let them be reachable.
 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
 > ---
 >  docs/website/download.html | 5 +++++
 >  1 file changed, 5 insertions(+)

 > diff --git a/docs/website/download.html b/docs/website/download.html
 > index bfacd82..4462d3a 100644
 > --- a/docs/website/download.html
 > +++ b/docs/website/download.html
 > @@ -47,6 +47,11 @@ want to follow development, but cannot or do not wish to use Git.
 >  	</li>
 >  </ul>
 
 > +<p>
 > +Older versions can be downloaded from
 > +<a href="http://buildroot.net/downloads/">the release archive</a>.

We have .org / .net and the webserver also listens on https, so I've
changed it to simply be /downloads/ like elsewhere on the website.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
