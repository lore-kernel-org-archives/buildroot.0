From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 15 Apr 2016 16:23:23 -0300
Subject: [Buildroot] [git commit] configs/minnowboard_max: configure
	eth0 through dhcp
In-Reply-To: <8737qmhf5u.fsf@dell.be.48ers.dk>
References: <20160415081911.5BA4A80338@busybox.osuosl.org>
 <CAAEAJfDqYwZ5e4Tq8-BaUqT5fWb=R3aQ5Vf2nNTJ4s63ukwsPQ@mail.gmail.com>
 <8737qmhf5u.fsf@dell.be.48ers.dk>
Message-ID: <CAAEAJfDQOgb1rGQQw5rXdPqrGW1ZYdAr__zG1O8DicDvJwQjuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15 April 2016 at 15:59, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:
>
>  > On 15 April 2016 at 05:17, Peter Korsgaard <peter@korsgaard.com> wrote:
>  >> commit: https://git.buildroot.net/buildroot/commit/?id=ba40ce77ea7babb36a74adeb4772b54142f86975
>  >> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>  >>
>  >> The minnowboard max board has an ethernet port, so configure it at startup.
>  >>
>
>  > Any reason why you are only doing this change for the Minnowboard MAX,
>  > and not also the Minnowboard?
>
> Only the fact that I have a max, but not one of the original
> minnowboards, so I couldn't test it.
>
> Do you have one of the old ones? If not, I believe Thomas does.
>

Hm, no I don't. But I'm pretty sure it has eth0 :-)
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
