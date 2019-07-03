From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 4 Jul 2019 00:16:07 +0200
Subject: [Buildroot] [PATCH 1/1] Standardize my email address.
In-Reply-To: <20190701163029.5819-1-aduskett@gmail.com>
References: <20190701163029.5819-1-aduskett@gmail.com>
Message-ID: <46f31335-000d-40f2-f4ea-c0476557ddfe@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Adam,

On 01/07/2019 18:30, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> This changes the email address I use to just my standard aduskett at gmail.com
> email address.

 Please avoid 1st person references in commit messages, because it is not always
clear who is speaking.

 Especially in the subject line, it's annoying when you do a oneline log and you
don't see who 'my' refers to.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/heirloom-mailx/0002-fix-libressl-support.patch        | 4 ++--
>  package/libglib2/0001-fix-compile-time-atomic-detection.patch | 2 +-
>  package/libsepol/0001-support-static-only.patch               | 4 ++--
>  package/libsepol/0002-revert-ln-relative.patch                | 2 +-
>  ...auto-type-sizeof-rework-autotest-to-be-cross-compila.patch | 2 +-
>  package/php/0003-configure-disable-the-phar-tool.patch        | 2 +-
>  ...1-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch | 4 ++--
>  package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch   | 4 ++--
>  .../python3/0032-fix-building-on-older-distributions.patch    | 4 ++--
>  package/setools/0001-remove-werror-flag-from-setup.patch      | 4 ++--
>  ...Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch | 2 +-
>  package/systemd/0001-install-don-t-use-ln-relative.patch      | 4 ++--

 Some of these may have found their way upstream with the wrong email address...
But I figured that that's not so important, so I applied to master with the
following commit message:

    Standardize Adam Duskett's email address

    Globally change Adam Duskett's email address to aduskett at gmail.com.

    Note that one or two of the patches may have been applied upstream with
    the old email address, but in that case those patches will anyway be
    removed when bumping.

    Signed-off-by: Adam Duskett <Aduskett@gmail.com>
    Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout
