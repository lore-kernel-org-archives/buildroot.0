From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 21:19:46 +0100
Subject: [Buildroot] [PATCH v3, 1/2] lxc: fix missing include for va_list
In-Reply-To: <20181204201553.11463-1-fontaine.fabrice@gmail.com>
References: <20181204201553.11463-1-fontaine.fabrice@gmail.com>
Message-ID: <20181206211946.124b7e2a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Dec 2018 21:15:52 +0100, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/0b90e7dca2984652842832a41abad93ac49a9b86
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...01-stringutils-include-stdarg-for-va_list.patch | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/lxc/0001-stringutils-include-stdarg-for-va_list.patch

Applied to master after updating the upstream status of the patch,
since it was applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
