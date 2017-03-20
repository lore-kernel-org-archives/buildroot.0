From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 21:15:58 +0100
Subject: [Buildroot] [PATCH 1/2] keepalived: fix libnl optional
 dependnecy
In-Reply-To: <f81b2b2f55f9f4294cf46af025e4a6108e5f413e.1490039846.git.baruch@tkos.co.il>
References: <f81b2b2f55f9f4294cf46af025e4a6108e5f413e.1490039846.git.baruch@tkos.co.il>
Message-ID: <20170320211558.432299e0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Mar 2017 21:57:25 +0200, Baruch Siach wrote:

> +	select BR2_PACKAGE_LIBNFNETLINK if BR2_PACKAGE_LIBNL

We generally don't do this, and only do the "double" condition that you
have below.

But if you prefer this "select", then the double condition is no longer
needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
