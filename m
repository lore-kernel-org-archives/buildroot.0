From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 14 Jan 2016 21:27:43 -0200
Subject: [Buildroot] [RFC PATCH v2 0/4] package/dhcp
Message-ID: <56982eef6f13a_72e5f2a044692@ultri2.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Doug,

On Wed, 13 Jan 2016 16:38:27 -0600, Doug Kehn wrote:
[snip]
> Does the series need to retain the RFC tag, or is the handling of
> the embedded bind tar-ball acceptable?
Regarding the tag, I can't say for sure. I am still new to this mailing list.
Maybe someone else can advise?

I found an issue in the bind configuration when using an external toolchain.
BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_DHCP=y
BR2_PACKAGE_DHCP_CLIENT=y
I will post a suggestion in the appropriate patch from de series (1/4).

Regards,
Ricardo
