From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Fri, 12 Feb 2021 16:20:02 +0100
Subject: [Buildroot] 
 =?iso-8859-1?q?=5BPATCHv2_7/7=5D_package/sysrepo=3A_?=
 =?iso-8859-1?q?remove_explicit_setting_of_CMAKE=5FBUILD=5FTYPE?=
In-Reply-To: <20210212135451.22786-8-patrickdepinguin@gmail.com>
References: <20210212135451.22786-1-patrickdepinguin@gmail.com>
 <20210212135451.22786-8-patrickdepinguin@gmail.com>
Message-ID: <aa713a1f-7239-4517-acac-e69d51b92fe8@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On p?tek 12. ?nora 2021 14:54:50 CET, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>
> sysrepo explicitly set CMAKE_BUILD_TYPE=Release, ignoring any possible
> value of BR2_ENABLE_DEBUG (previously) or BR2_ENABLE_RUNTIME_DEBUG (now).
>
> With the introduction of BR2_ENABLE_RUNTIME_DEBUG, this change should no
> longer be necessary. Users that do not wish to have additional runtime
> debugging just keep BR2_ENABLE_RUNTIME_DEBUG disabled (default value).
>
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
> v2: Jan Kundr?t:
> - explicitly set REPO_PATH, which is set to a host path in case of
>   CMAKE_BUILD_TYPE=Debug (see e.g.
>   https://github.com/sysrepo/sysrepo/blob/v1.4.104/CMakeLists.txt#L138-L144)

Reviewed-by: Jan Kundr?t <jan.kundrat@cesnet.cz>

Jan
