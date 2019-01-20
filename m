From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 20 Jan 2019 23:34:26 +0100
Subject: [Buildroot] [PATCH v2] package/sunxi-mali-mainline-driver: bump
 version
In-Reply-To: <20190110224235.125936-1-giulio.benetti@micronovasrl.com>
References: <20190110221615.6dc304bf@windsurf>
 <20190110224235.125936-1-giulio.benetti@micronovasrl.com>
Message-ID: <CACXmViZG0Du2M+v4jhrhN8ytgONFsrMXnKBJoaiLqmYMdZ20ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 10, 2019 at 11:42 PM Giulio Benetti
<giulio.benetti@micronovasrl.com> wrote:
>
> For 4.20 support.
>
> git shortlog --invert-grep --grep travis --no-merges 143ff2b17de63ce931c4f758771969e75c09a4c7..
> Roman Stratiienko (1):
>       mali: support building against 4.20
>
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
> V1->V2:
> * update hash file with new tarball sha256

Committed, thanks.

-- 
Bye, Peter Korsgaard
