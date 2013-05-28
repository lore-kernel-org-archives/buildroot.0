From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 May 2013 21:45:40 +0200
Subject: [Buildroot] Issue with the autobuilders: removing 1379 builds
 from the history?
In-Reply-To: <20130528091052.16da9159@skate>
References: <20130528091052.16da9159@skate>
Message-ID: <51A50964.7090503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/05/13 09:10, Thomas Petazzoni wrote:
> This means that when you try to reproduce the build, if you take the
> Git commit id given by the autobuilder website, then you won't be
> testing with the Git commit id with which the build was made, which is
> quite annoying. This is what happened to me when trying to reproduce
> the flex problem: I have a script that, given a build SHA1, downloads
> the configuration and Git commit ID, and restarts the build with the
> exact same commit and the exact same configuration. But for those
> builds who reported an invalid Git commit ID... it cannot work, and
> therefore I wasn't reproducing the flex problem.
>
> Therefore, I am considering removing those completely bogus build
> results from the history. We are talking about removing 1379 build
> results, i.e all builds done my autobuilder between May, 14th and today.
>
> Even though it is quite annoying to lose so many results, I believe
> this is the best action we can take now.

  I would wait a couple of days before removing them. At least for the 
most recent ones, current HEAD probably still exposes the same problem, 
so in that sense the build result is still usable.

  Would it be possible to direct the URLs to a placeholder page 
explaining that the build result was removed, so existing links in commit 
messages don't die?


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
