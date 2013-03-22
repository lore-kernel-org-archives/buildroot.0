From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Fri, 22 Mar 2013 08:06:17 +0200
Subject: [Buildroot] [PATCH] czmq: new package
In-Reply-To: <1363870885-27916-1-git-send-email-spdawson@gmail.com>
References: <1363870885-27916-1-git-send-email-spdawson@gmail.com>
Message-ID: <CAAHaz6EahTVT7VWtSd02F16aLNyNJcpDc1vb6d9-Rsop2Rf5xA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Simon!

2013/3/21 <spdawson@gmail.com>
> +comment "czmq requires a toolchain with C++, LARGEFILE and WCHAR support"
> +       depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 &&
BR2_LARGEFILE && BR2_USE_WCHAR)

IPV6 is either omitted from the comment or falsely added to the condition.

--
Best regards,
  Alexander Lukichev
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130322/3c3b553b/attachment.html>
