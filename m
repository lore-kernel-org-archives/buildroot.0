From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 3 Nov 2016 08:45:06 +0100
Subject: [Buildroot] [PATCH 2/2] core: remove redundant "override O :=
	$(O)"
In-Reply-To: <20161103015517.15943-2-arnout@mind.be>
References: <20161103015517.15943-1-arnout@mind.be>
 <20161103015517.15943-2-arnout@mind.be>
Message-ID: <CAHXCMMJ=LBcLJ5xLNuOa1-MzvqACVdFcKGDhM4vxiBqtz-_SUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 3, 2016 at 2:55 AM, Arnout Vandecappelle (Essensium/Mind)
<arnout@mind.be> wrote:
> The top-level Makefile contains an "override O := $(O)" statement that
> is purportedly required to make sure the O flag doesn't leak into the
> environment of sub-makes. However, since commit 173135d, there is
> already an "override O := ..." a few lines down. Therefore, the first
> override is redundant.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
