From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 09 Mar 2013 22:18:50 +0100
Subject: [Buildroot] [PATCH] util-linux: bump version and revamp options
In-Reply-To: <1362696397-16738-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 7 Mar 2013 19:46:37 -0300")
References: <1362696397-16738-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87fw041dc5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Bump to latest 2.22.2 version and revamp available options.
 Gustavo> * Remove the assumed enable/disable defaults since these seem to change
 Gustavo>   quite often, so do what's wise and always enable/disable things.

 Gustavo> * Switch from build "X" menu options to just X, add some help and sort.

 Gustavo> * Introduce new option to install binaries (or not) to reduce bloat for
 Gustavo>   packages that just need libblkid and/or libuuid.

Committed, thanks.

-- 
Bye, Peter Korsgaard
