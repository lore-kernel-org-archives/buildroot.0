From: =?utf-8?B?SnVsaWVuIELDqXJhdWQ=?= <julien.beraud@orolia.com>
Date: Fri, 20 Sep 2019 07:50:34 +0000
Subject: [Buildroot] [git commit branch/2019.02.x] qt5base: Add patch to
 fix compile issue with gcc9
In-Reply-To: <20190919214812.6f719f06@windsurf>
References: <20190919073529.30254-1-julien.beraud@orolia.com>
 <87ef0c1f4j.fsf@dell.be.48ers.dk>
 <24a3771b-2bf4-66a7-2b84-13eeb87488c3@orolia.com>
 <20190919214812.6f719f06@windsurf>
Message-ID: <8d2d7eed-81d2-e2bf-4345-cac3f73ad01c@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/09/2019 21:48, Thomas Petazzoni wrote:
> That's not what Peter is talking about. He is talking about the prefix
> of your patch. Normally, patches are like this:
> 
>   [PATCH] package/qt5base: something
> 
> or:
> 
>   [PATCH 2019.02.x] package/qt5base: something
> 
> But you sent it as:
> 
>   [git commit branch/2019.02.x] ...
> 
> If you look at the mailing list traffic, e-mails prefixed with [PATCH]
> are actual patches submitted by contributors, while e-mails prefixed
> with [git commit] are auto-generated e-mails that get sent when the
> Buildroot maintainers merge some patches and push them as commits to
> the official Git repo.
> 
> Hence, your patch was quite confusing, because its title prefix looked
> like a Git commit notification.

Thanks for the explanation. So the correct way to send a patch for a 
specific branch is :
[PATCH branch-name] ... ?

Regards,
Julien
