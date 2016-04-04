From: Matthew Weber <matt@thewebers.ws>
Date: Mon, 4 Apr 2016 06:54:40 -0500
Subject: [Buildroot] [PATCH 4/4 v2] core/pkg-infra: download git
 submodules if the package wants them
In-Reply-To: <5702440F.5030707@barix.com>
References: <cover.1459541702.git.yann.morin.1998@free.fr>
 <8373904cdf1fee9724d6834b56efaa706a92fc31.1459541702.git.yann.morin.1998@free.fr>
 <CAFt09wNKtUSyEcQzL1o+p+f5m_bPwctndV8OKrQOXBqQBmsCpQ@mail.gmail.com>
 <5702440F.5030707@barix.com>
Message-ID: <CAFt09wMs3C_A5EHuX6ByqRazCibzqjSrPo_tdtzrMRtCAZo0Ew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alex,

On Mon, Apr 4, 2016 at 5:38 AM, Aleksandar Simeonov
<aleksandar@barix.com> wrote:
> Hi Yann, Mathew,
>
> Have you checked that this patch does not affect the download of packages
> not using GIT? For me it breaks the download of anything using WGET, for
> example dosfstools:
>

Yeah, but to be sure, I just did a clean and explicitly built
dosfstools along with a complete build.  Would you mind doing a
savedefconfig and pastebin your defconifg?  Also what hash did you add
the patchset on top of (I used 2cd5abf)?

Thanks,
Matt
