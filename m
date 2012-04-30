From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 30 Apr 2012 10:44:21 +0200
Subject: [Buildroot] [PATCH 1/2] uboot-tools: bump to version 2012.04.01
In-Reply-To: <1335539109-6447-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 27 Apr 2012 12:05:08 -0300")
References: <1335539109-6447-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87aa1t4niy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  .../uboot-tools-2011.03-drop-configh.patch         |   27 --------------------

Are you sure this isn't needed anymore? It seems to still include
config.h:

http://autobuild.buildroot.org/results/5eb75098b4820727d6eba56f589710df9f892e5e/build-end.log

-- 
Bye, Peter Korsgaard
