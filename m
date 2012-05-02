From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 May 2012 10:31:52 +0200
Subject: [Buildroot] [PATCH 3/4] conntrack-tools: new package
In-Reply-To: <1335790178-25333-3-git-send-email-gustavo@zacarias.com.ar>
References: <1335790178-25333-1-git-send-email-gustavo@zacarias.com.ar>
 <1335790178-25333-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20120502103152.1feb57d1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 30 Apr 2012 09:49:37 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> +CONNTRACK_TOOLS_DEPENDENCIES = host-bison host-flex host-pkg-config libnetfilter_conntrack

Bison and Flex are part of our required host dependencies in
support/dependencies/dependencies.sh. Can't we use these instead?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
