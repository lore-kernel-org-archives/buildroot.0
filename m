From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 May 2017 17:25:20 +0200
Subject: [Buildroot] [V2 1/1] Developers: Add selinux packages under
 Adam Duskett
In-Reply-To: <20170526144628.27137-1-aduskett@codeblue.com>
References: <20170526144628.27137-1-aduskett@codeblue.com>
Message-ID: <20170527172520.65774584@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 26 May 2017 10:46:28 -0400, Adam Duskett wrote:

>  N:	Adam Duskett <aduskett@gmail.com>
> +F:	package/audit/
> +F:	package/checkpolicy

Missing final /

> +F:	package/setools

Ditto.

I've fixed these and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
