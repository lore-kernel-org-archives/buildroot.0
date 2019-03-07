From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Mar 2019 22:12:23 +0100
Subject: [Buildroot] [PATCH 1/2] package/wireshark: fix build with uclibc
In-Reply-To: <20190305210546.9200-1-fontaine.fabrice@gmail.com>
References: <20190305210546.9200-1-fontaine.fabrice@gmail.com>
Message-ID: <20190307221223.07d33c90@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  5 Mar 2019 22:05:45 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/c41d42fe3489bc63c42e7ce7a9eccb1b4ca7b9b2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...acket-gtp.c-rename-_header-to-_ext_header.patch | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/wireshark/0001-packet-gtp.c-rename-_header-to-_ext_header.patch

Could you resend this patch, updated to use the patch that was accepted
upstream ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
