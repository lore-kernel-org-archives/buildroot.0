From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 10 May 2016 10:59:16 -0300
Subject: [Buildroot] [PATCH] supertuxkart: new package
In-Reply-To: <9cf89fcf-1d3a-6255-06ae-8b700a5d6fd1@mind.be>
References: <1460439224-29314-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <570D80C2.70508@mind.be>
 <CAAEAJfBO034-Nonhz=2u4=akxD1ZY4Hx5yRgXfV2+CbprK9+9g@mail.gmail.com>
 <9cf89fcf-1d3a-6255-06ae-8b700a5d6fd1@mind.be>
Message-ID: <CAAEAJfCMp+K-7jvMc+Aa7fHXq2=wOLo33UMy140Dpk=RHbtahw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 9 May 2016 at 20:16, Arnout Vandecappelle <arnout@mind.be> wrote:
[..]
>> Why? If the package bundles a glew, why not using it?
>
>

As a matter of fact, they bunde jpeglib, libpng, zlib and a few more as well.

>  We avoid bundled libraries for several reasons:
>

Sure, I understand why bundling is a shitty idea. My point is:
it was not OUR idea, but something that comes from upstream.

I haven't checked, but given they bundle their own Irrlicht engine
(and even they modified it enough to call it Antarctica now), it seems
they know what they are doing.

Or another possible explanation is that they are lazy, and wanted
to bundle to make installation easier (in some non-Linux OS?).

Whatever the reasons, I don't want to spend time modifying a package
in a way that won't be accepted upstream.

[..]
>
>  However, it's possible that supertuxkart has made project-specific
> modifications to libglew, in this case unbundling is difficult. I see that
> at least it is an older version than what we have.
>

Exactly my point. And even if they haven't made modifications to some of
the bundled packages, I really don't want to spend time doing a change that
is not in the upstream roadmap.
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
