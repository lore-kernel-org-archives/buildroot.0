From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 23:09:28 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/qpid-proton: bump to version 0.33.0
In-Reply-To: <20210202172705.1515638-1-fontaine.fabrice@gmail.com>
References: <20210202172705.1515638-1-fontaine.fabrice@gmail.com>
Message-ID: <20210316230928.7296e00e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  2 Feb 2021 18:27:05 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

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
> ---
> Changes v1 -> v2:
>  - Bump to version 0.33.0 and removed patch applied uptream

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
