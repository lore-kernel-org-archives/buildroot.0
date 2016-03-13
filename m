From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 13 Mar 2016 06:07:25 +0300
Subject: [Buildroot] [PATCH] slang: do install-pkgconfig when building
 static library
In-Reply-To: <20160312220458.GB3745@free.fr>
References: <1457772849-7501-1-git-send-email-jcmvbkbc@gmail.com>
 <20160312220458.GB3745@free.fr>
Message-ID: <CAMo8Bf+TTwQEwV77Q1+-oiPXGpemKQBwyh8WrynGqrOmFHzK5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 13, 2016 at 1:04 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> MAx, All,
>
> On 2016-03-12 11:54 +0300, Max Filippov spake thusly:
>> mc's configure can't find S-Lang because static S-Lang build doesn't
>> install pkgconfig file into staging. Adding install-pkgconfig to
>> SLANG_INSTALL_STAGING_OPTS fixes that.
>>
>> Fixes:
>>   http://autobuild.buildroot.net/results/085194f18bc7db1e801d98e6620e3a75fd988cc5/
>
> Could you instead fix the 0002-Enable-a-statically-linked-version-of-slsh
> patch to have install-static also depend on install-pkgconfig, please?

Done.

-- 
Thanks.
-- Max
