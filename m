From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 05 May 2013 21:00:52 +0200
Subject: [Buildroot] [PATCHv2] nettle: fix ARM NEON breakage
In-Reply-To: <1367757308-18176-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 5 May 2013 09:35:08 -0300")
References: <1367757308-18176-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87d2t5p7yz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Nettle's ARM NEON optimizations use some assembly constructs
 Gustavo> that aren't friendly with binutils < 2.21, so just disable it
 Gustavo> for external toolchains or internal with an unsupported
 Gustavo> version.
 Gustavo> http://autobuild.buildroot.net/results/3c6f91379f90d438b4da3dd330cf89e1dd746aaf/

Committed, thanks.

-- 
Bye, Peter Korsgaard
