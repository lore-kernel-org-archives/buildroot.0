From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 Mar 2012 21:27:06 -0300
Subject: [Buildroot] [PATCH v1 1/1] uClibc 0.9.33 : patches from 0.9.32
 should be applied to uClibc 0.9.33 too.
In-Reply-To: <1332284023-32025-2-git-send-email-sagaert.johan@skynet.be>
References: <1332284023-32025-1-git-send-email-sagaert.johan@skynet.be>
 <1332284023-32025-2-git-send-email-sagaert.johan@skynet.be>
Message-ID: <c193c4c1af2036e9ee7d3eebec2a90ff@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-20 19:53, Sagaert Johan wrote:

>  create mode 100644 
> toolchain/uClibc/uClibc-0.9.33-sparc-errno-fix.patch

This one shouldn't be required either since it's just a build fix for 
SPARC which was fixed in another way most likely by uClibc committ
96c9a8f7d00cdf6bb7968a2390b9d87da8a45e2d
Regards.
