From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 10 Mar 2016 21:57:08 +0100
Subject: [Buildroot] [PATCH] lksctp-tools: fix musl build
In-Reply-To: <20160310213830.322852f1@free-electrons.com>
References: <1457602091-14399-1-git-send-email-yegorslists@googlemail.com>
 <20160310213830.322852f1@free-electrons.com>
Message-ID: <CAGm1_ktZ0YugQVWxUTDebouVOfUh2GLpZEeX8C=VKEkou_BP=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 10, 2016 at 9:38 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 10 Mar 2016 10:28:11 +0100, yegorslists at googlemail.com wrote:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> Add a patch replacing __BEGIN_DECLS/__END_DECLS with
>> "extern "C" {" definition.
>>
>> Fixes:
>>
>> http://autobuild.buildroot.net/results/d7d/d7d1c6a13ad788ef74ac0487bf2bdbdcd7d52d40/
>> http://autobuild.buildroot.net/results/06a/06a76d80701b126789c6c8e867db067e3b927caa/
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> Please submit upstream, thanks!

Patch already accepted upstream.

Yegor
