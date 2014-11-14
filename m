From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Nov 2014 14:19:04 +0100
Subject: [Buildroot] [PATCH 08/10] dhcp: update dhclient-script
In-Reply-To: <1415969096-3032-9-git-send-email-gustavo@zacarias.com.ar>
References: <1415969096-3032-1-git-send-email-gustavo@zacarias.com.ar>
 <1415969096-3032-9-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141114141904.4bfa5f21@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 14 Nov 2014 09:44:54 -0300, Gustavo Zacarias wrote:

> diff --git a/package/dhcp/dhclient-script b/package/dhcp/dhclient-script
> index 5566aca..4afebc0 100755
> --- a/package/dhcp/dhclient-script
> +++ b/package/dhcp/dhclient-script
> @@ -1,2 +1,281 @@
>  #!/bin/sh
> -# empty dhclient-script to keep dhclient from complaining

I think we want a comment here that tells where the script is coming
from (URL, license, etc.).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
