From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Sep 2019 21:48:12 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] qt5base: Add patch to
 fix compile issue with gcc9
In-Reply-To: <24a3771b-2bf4-66a7-2b84-13eeb87488c3@orolia.com>
References: <20190919073529.30254-1-julien.beraud@orolia.com>
 <87ef0c1f4j.fsf@dell.be.48ers.dk>
 <24a3771b-2bf4-66a7-2b84-13eeb87488c3@orolia.com>
Message-ID: <20190919214812.6f719f06@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 19 Sep 2019 16:07:33 +0000
Julien B?raud <julien.beraud@orolia.com> wrote:

> On 19/09/2019 17:26, Peter Korsgaard wrote:
> >>>>>> "Julien" == Julien B?raud <julien.beraud@orolia.com> writes:  
> >   
> >   > Backport:
> >   > https://github.com/qt/qtbase/commit/a52d7861edfb5956de38ba80015c4dd0b596259b#diff-0b4819f9df9c43297ba840d1ac401599
> >   > Signed-off-by: Julien Beraud <julien.beraud@orolia.com>  
> > 
> > Ehh, I got a bit confused first as this looked like a git commit
> > notification.  
> 
> Sorry I am just referring to the commit in the upstream project

That's not what Peter is talking about. He is talking about the prefix
of your patch. Normally, patches are like this:

 [PATCH] package/qt5base: something

or:

 [PATCH 2019.02.x] package/qt5base: something

But you sent it as:

 [git commit branch/2019.02.x] ...

If you look at the mailing list traffic, e-mails prefixed with [PATCH]
are actual patches submitted by contributors, while e-mails prefixed
with [git commit] are auto-generated e-mails that get sent when the
Buildroot maintainers merge some patches and push them as commits to
the official Git repo.

Hence, your patch was quite confusing, because its title prefix looked
like a Git commit notification.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
