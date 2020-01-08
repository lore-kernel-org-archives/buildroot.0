From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Jan 2020 09:33:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/jsoncpp: disable tests
In-Reply-To: <20200108065324.3577371-1-fontaine.fabrice@gmail.com>
References: <20200108065324.3577371-1-fontaine.fabrice@gmail.com>
Message-ID: <20200108093308.4b1d8110@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  8 Jan 2020 07:53:24 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable tests to avoid a build failure on gcc 4.8 because of
> std::hexfloat added in version 1.9.2 with
> https://github.com/open-source-parsers/jsoncpp/commit/638ad269e75f28f9830f7bfc01278aeaf5b00135
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f816229b835f61fa3e4c84aa659d30f81191f369
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/jsoncpp/0001-Meson-updates.patch | 147 +++++++++++++++++++++++
>  package/jsoncpp/jsoncpp.mk               |   1 +
>  2 files changed, 148 insertions(+)
>  create mode 100644 package/jsoncpp/0001-Meson-updates.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
