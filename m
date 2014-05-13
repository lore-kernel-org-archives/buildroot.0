From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 13 May 2014 23:37:07 +0200
Subject: [Buildroot] [PATCHv2] btrfs-progs: disable for avr32
In-Reply-To: <1399973804-11934-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 13 May 2014 06:36:44 -0300")
References: <1399973804-11934-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bnv1uzr0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Toolchain issues prevent it from being built, also there's no AVR32 with
 > proper storage ports for such a filesystem. Fixes:
 > http://autobuild.buildroot.net/results/06501fd32c30549810c12f0ad50f510c4b74ee63/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
