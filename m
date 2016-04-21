From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 22:40:00 +0200
Subject: [Buildroot] [PATCHv2 1/4] Add package cryptopp
In-Reply-To: <1458227038-16383-2-git-send-email-julian@jusst.de>
References: <1458227038-16383-1-git-send-email-julian@jusst.de>
 <1458227038-16383-2-git-send-email-julian@jusst.de>
Message-ID: <20160421224000.031987c9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Mar 2016 16:03:55 +0100, Julian Scheel wrote:
> Signed-off-by: Julian Scheel <julian@jusst.de>
> ---
>  package/cryptopp/cryptopp.hash |  2 ++
>  package/cryptopp/cryptopp.mk   | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 package/cryptopp/cryptopp.hash
>  create mode 100644 package/cryptopp/cryptopp.mk

This package causes some build failures:

  http://autobuild.buildroot.org/?reason=host-cryptopp-5.6.3

Could you have a look at them?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
