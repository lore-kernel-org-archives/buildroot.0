From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 15:49:37 +0100
Subject: [Buildroot] [PATCH v4,1/1] cjson: bump to version v1.0.2
In-Reply-To: <1480794465-72952-1-git-send-email-fabrice.fontaine@orange.com>
References: <1480794465-72952-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20161204154937.751c091b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Dec 2016 20:47:45 +0100, Fabrice Fontaine wrote:
> This is a major update in cjson:
>  - project site moved from sourceforge to github
>  - project recommends to use the new cmake buildsystem instead of the
>    legacy make
>  - BR2_STATIC_LIBS is now OK (README does not mention issue anymore)
>  - As include path and library name have changed, tinycbor has to be
>    updated
>  - As cjson can now be built as a static library, fix a bug in
>    json2cbor compilation from tinycbor package
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> ---
> Changes v3 -> v4 (after review of Thomas Petazzoni):
>  - Fix static compilation of json2cbor in tinycbor

Applied to master, thanks. Please submit the tinycbor patches to the
upstream project. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
