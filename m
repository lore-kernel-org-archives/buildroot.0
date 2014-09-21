From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 22:44:23 +0200
Subject: [Buildroot] [PATCH v8] bcache-tools: Adding package.
In-Reply-To: <1410121662-23096-1-git-send-email-jcd@tribudubois.net>
References: <1410121662-23096-1-git-send-email-jcd@tribudubois.net>
Message-ID: <20140921224423.25163821@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jean-Christophe DUBOIS,

On Sun,  7 Sep 2014 22:27:42 +0200, Jean-Christophe DUBOIS wrote:
> This is the bcache tools, required to setup the linux bcache
> feature of the Linux kernel.
> 
> Signed-off-by: Jean-Christophe DUBOIS <jcd@tribudubois.net>

Thanks, patch applied, after doing the change suggested by Yann (use
only one hook to create the missing directories).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
