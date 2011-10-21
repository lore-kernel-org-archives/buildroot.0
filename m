From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Oct 2011 08:51:21 +0200
Subject: [Buildroot] [PATCH 1/4] pppd: bugfixes and enhancements
In-Reply-To: <1319132933-13938-1-git-send-email-gustavo@zacarias.com.ar>
References: <1319132933-13938-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20111021085121.13ff68d3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 20 Oct 2011 14:48:50 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> Fix exponential timeout bug for PPPoE.
> Fix undefined (0.0.0.0) default gateway issue.
> Add adaptive LCP echo patch and gateway metric functionality.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Have those patches been submitted upstream ? We really don't want to
start accumulating too many non-build related patches, such as bug
fixes or feature additions.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
