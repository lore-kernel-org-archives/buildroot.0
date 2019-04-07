From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 7 Apr 2019 13:45:24 -0700
Subject: [Buildroot] [PATCH 1/1] boost: correctly disable icu in locale
 if needed
In-Reply-To: <20190407222519.01e928a6@windsurf>
References: <20180713174247.4005-1-fontaine.fabrice@gmail.com>
 <20190407222519.01e928a6@windsurf>
Message-ID: <CAMo8Bf+3Q310wGTJWWeSGP8G2-71m0yEVhWZ6wQJfe6CpfC8gQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Apr 7, 2019 at 1:25 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> the last Boost build errors I
> can see at http://autobuild.buildroot.net/?reason=boost% are:
>
>  - Download failure due to DNS resolution problem (late March)
>
>  - Internal compiler error on Xtensa, mips64, ARC (dating back from
>    January/February)

I didn't see that. Will take a look at the ICE on xtensa.

-- 
Thanks.
-- Max
