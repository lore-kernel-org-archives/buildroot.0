From: =?utf-8?B?SnVsaWVuIELDqXJhdWQ=?= <julien.beraud@orolia.com>
Date: Thu, 19 Sep 2019 16:07:33 +0000
Subject: [Buildroot] [git commit branch/2019.02.x] qt5base: Add patch to
 fix compile issue with gcc9
In-Reply-To: <87ef0c1f4j.fsf@dell.be.48ers.dk>
References: <20190919073529.30254-1-julien.beraud@orolia.com>
 <87ef0c1f4j.fsf@dell.be.48ers.dk>
Message-ID: <24a3771b-2bf4-66a7-2b84-13eeb87488c3@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/09/2019 17:26, Peter Korsgaard wrote:
>>>>>> "Julien" == Julien B?raud <julien.beraud@orolia.com> writes:
> 
>   > Backport:
>   > https://github.com/qt/qtbase/commit/a52d7861edfb5956de38ba80015c4dd0b596259b#diff-0b4819f9df9c43297ba840d1ac401599
>   > Signed-off-by: Julien Beraud <julien.beraud@orolia.com>
> 
> Ehh, I got a bit confused first as this looked like a git commit
> notification.

Sorry I am just referring to the commit in the upstream project

> 
> Why would this be applicable for 2019.02.x? We don't offer gcc9 support
> in 2019.02.x.

This issue happens when trying to build qt5 on buildroot on a machine 
that has gcc9 (native) installed. It is not a cross-compilation issue. 
Do you mean that you don't want to support that ?

Julien
