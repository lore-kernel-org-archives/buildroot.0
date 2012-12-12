From: Woody Wu <narkewoody@gmail.com>
Date: Wed, 12 Dec 2012 16:26:59 +0000 (UTC)
Subject: [Buildroot] Chances in skeleton don't appear in filesystem
References: <slrnkbqn5h.1p8.narkewoody@zuhnb712.local.com>
 <20121204100344.3167d0e9@skate> <874nk1l7lo.fsf@dell.be.48ers.dk>
Message-ID: <slrnkchc0i.nfe.narkewoody@zuhnb712.local.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-12-04, Peter Korsgaard
<jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas Petazzoni
>>>>>> <thomas.petazzoni@free-electrons.com>
>>>>>> writes:
>
> >> What's the correct method to modify the defualt filesystem? Thanks.
>
> Thomas> Do use a custom skeleton, use a custom post-build script to
> copy/modify Thomas> files in output/target. See
>
> s/Do use/Do NOT use/
>
> Alternatively, if you do use a custom rootfs skeleton and want the
> skeleton changes to be taken into consideration without doing a clean
> rebuild you can manually make the changes under output/target as well
> and rerun make.
>
> Using a post-build script is easier though.
>

Thanks both. By far, the post script method works fine for me.

-- 
woody
I can't go back to yesterday - because I was a different person then.
