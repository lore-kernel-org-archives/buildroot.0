From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Fri, 23 Apr 2021 10:53:33 +0300
Subject: [Buildroot] [PATCH 1/1] package/protozero: disable tests
In-Reply-To: <20210422182443.654635-1-fontaine.fabrice@gmail.com>
References: <20210422182443.654635-1-fontaine.fabrice@gmail.com>
Message-ID: <792aebd5-8e2f-f273-6ad3-7b1387dd8393@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

22.04.2021 21:24, Fabrice Fontaine wrote:
> Add a patch to disable tests through the standard BUILD_TESTING variable
> which is already passed by cmake-package.
> 
> While at it, drop protobuf dependency which is only needed for tests
> 
> This will fix a build failure on toolchains without wchar, toolchains
> for sh4 (ICE) or toolchains where gcc is affected by bug 64735.
> 
> Upstream thinks that this is unecessary but no additional feedback was
> received on how we should handle those build failures
> 
> Fixes:
>   -http://autobuild.buildroot.org/results/1cd24b757d87b963c70bc7ff927c6d983d0b142a
> 
> Signed-off-by: Fabrice Fontaine<fontaine.fabrice@gmail.com>


Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
