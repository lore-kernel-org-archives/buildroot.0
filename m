From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Jun 2021 23:35:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/runc: security bump to version
 1.0.0-rc95
In-Reply-To: <20210521203402.GR3208066@scaer> (Yann E. MORIN's message of
 "Fri, 21 May 2021 22:34:02 +0200")
References: <20210521201517.214072-1-christian@paral.in>
 <20210521203402.GR3208066@scaer>
Message-ID: <87r1hduzn8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Christian, All,
 > On 2021-05-21 13:15 -0700, Christian Stewart spake thusly:
 >> Fixes CVE-2021-30465: runc 1.0.0-rc94 and earlier are vulnerable to a symlink
 >> exchange attack whereby an attacker can request a seemingly-innocuous container
 >> configuration that actually results in the host filesystem being bind-mounted
 >> into the container, allowing for a container escape.
 >> 
 >> Signed-off-by: Christian Stewart <christian@paral.in>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
