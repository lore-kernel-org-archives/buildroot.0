From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 22:44:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/musepack: fix musl build
In-Reply-To: <1454142700-9293-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454142700-9293-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160207224432.4532ebc0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 30 Jan 2016 09:31:40 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/6eb/6ebc9cbee3fc48f4f5b658d11b040ad62fb6607f/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/musepack/0003-musl.patch | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 package/musepack/0003-musl.patch

I've applied, but to be honest, I almost rejected your patch:

 1/ The musepack patch does two completely different things, they
    should have been two separate patches.

 2/ "Fix musl" is not a proper patch description. Due to this, I have
    to dig myself again in the issue, to understand what was the
    problem, and how your patch fixes it. Please add a proper
    description to each and every patch. "Fix musl" is *not* a good
    description.

See
https://git.busybox.net/buildroot/commit/package/musepack?id=5f3aed3f50ff48c8a60185407d7220aeedfea5e5
for the type of description that we need to have.

Don't get me wrong: I definitely appreciate your effort to fix numerous
musl build failures. But with such short descriptions, I have to
basically re-do all the investigation you have already done... which
means I spend as much time as you have done. Could you please help by
writing longer patch descriptions ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
