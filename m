From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Nov 2016 23:49:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 6.9.1
In-Reply-To: <1479142730-21743-1-git-send-email-cloudyparts@icloud.com>
References: <1479142730-21743-1-git-send-email-cloudyparts@icloud.com>
Message-ID: <20161114234913.787c714e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Nov 2016 11:58:50 -0500, Patrick Devlin wrote:
> https://nodejs.org/en/blog/release/v6.9.1/
> 
> The patches from 6.7.0 have been copied to 6.9.1.
> 
> Signed-off-by: Patrick Devlin <cloudyparts@icloud.com>
> ---
>  .../{6.7.0 => 6.9.1}/0001-gyp-force-link-command-to-use-CXX.patch     | 0
>  .../0002-inspector-don-t-build-when-ssl-support-is-disabled.patch     | 0
>  package/nodejs/Config.in                                              | 2 +-
>  package/nodejs/nodejs.hash                                            | 4 ++--
>  4 files changed, 3 insertions(+), 3 deletions(-)
>  rename package/nodejs/{6.7.0 => 6.9.1}/0001-gyp-force-link-command-to-use-CXX.patch (100%)
>  rename package/nodejs/{6.7.0 => 6.9.1}/0002-inspector-don-t-build-when-ssl-support-is-disabled.patch (100%)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
