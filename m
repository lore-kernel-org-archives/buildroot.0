From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Apr 2021 22:43:41 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-mbstrdecoder: add
 python-chardet dependency
In-Reply-To: <20210410122618.79085-1-fontaine.fabrice@gmail.com>
References: <20210410122618.79085-1-fontaine.fabrice@gmail.com>
Message-ID: <20210421224341.3322d90c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 10 Apr 2021 14:26:17 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> chardet is a mandatory runtime dependency since version 0.8.2 and
> https://github.com/thombashi/mbstrdecoder/commit/e9344a0916f65d143c51e0680c30db4ae7690ccf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-mbstrdecoder/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
