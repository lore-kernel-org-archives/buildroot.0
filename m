From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Dec 2017 12:47:18 +0100
Subject: [Buildroot] [PATCH] json-c: fix build without threads support
In-Reply-To: <969aa23e24cae04dd3d71c0d29c48445b0335a4d.1514673089.git.baruch@tkos.co.il>
References: <969aa23e24cae04dd3d71c0d29c48445b0335a4d.1514673089.git.baruch@tkos.co.il>
Message-ID: <20171231124718.4bb152b8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Dec 2017 00:31:29 +0200, Baruch Siach wrote:

> +# Patching configure.ac
> +JSON_C_AUTORECONF = YES
> +HOST_JSON_C_AUTORECONF = YES

I've dropped this last line, because it is implied by JSON_C_AUTORECONF
= YES, and then I've applied. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
