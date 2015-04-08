From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 21:15:36 +0200
Subject: [Buildroot] [PATCH 2/2] strongswan: bump to version 5.3.0
In-Reply-To: <1428488444-8124-2-git-send-email-gustavo@zacarias.com.ar>
References: <1428488444-8124-1-git-send-email-gustavo@zacarias.com.ar>
 <1428488444-8124-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150408211536.4f59b3fc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed,  8 Apr 2015 07:20:44 -0300, Gustavo Zacarias wrote:
> Enable connmark and forecast plugins when iptables is selected.
> And always enable the led plugin, though it's not new to 5.3.0.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

You missed updating the hash file, so I did that while committing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
