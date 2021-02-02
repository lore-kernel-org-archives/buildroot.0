From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 2 Feb 2021 23:02:43 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/qpid-proton: bump to version 0.33.0
In-Reply-To: <20210202172705.1515638-1-fontaine.fabrice@gmail.com>
References: <20210202172705.1515638-1-fontaine.fabrice@gmail.com>
Message-ID: <2cfb91ab-c78a-42f5-0deb-89076355abf9@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On 02/02/21 18:27, Fabrice Fontaine wrote:
> - Update site to get latest version
> - Remove all patches (already in version)
> - License file has been renamed and slightly updated to change paths
>   since version 0.23.0 and
>   https://github.com/apache/qpid-proton/commit/37136940e3077f25ce58c94775f48c66f666f4a8
> - Remove BUILD_{JAVA,JAVASCRIPT,PERL,PHP} as those bindings don't exist
>   anymore
> - Disable go binding
> - Disable fuzz testing
> - Add new optional libuv and jsoncpp dependencies
> - Update QPID_PROTON_REMOVE_USELESS_FILES
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

Thanks!
-- 
Luca
