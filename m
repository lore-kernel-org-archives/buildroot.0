From: Robert P. J. Day <rpjday@crashcourse.ca>
Date: Thu, 16 Apr 2015 18:42:29 -0400 (EDT)
Subject: [Buildroot] [PATCH] Makefile: remove redundant mkdir from
	*config
In-Reply-To: <1429222358-3446-1-git-send-email-arnout@mind.be>
References: <1429222358-3446-1-git-send-email-arnout@mind.be>
Message-ID: <alpine.LFD.2.11.1504161841100.9373@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Apr 2015, Arnout Vandecappelle (Essensium/Mind) wrote:

> The first dependency of these targets is
> $(BUILD_DIR)/buildroot-config/conf
> so the $(BUILD_DIR)/buildroot-config directory certainly exists.

  technically, not quite ... the first dependency is *some* variation
of "*conf" such as nconf or qconf, etc, not just "conf". but the
redundancy is true for all such variations.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
