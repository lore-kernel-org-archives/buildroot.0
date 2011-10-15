From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 15 Oct 2011 23:22:44 +0200
Subject: [Buildroot] [PATCH 20/25] ifplugd: misc fixes
In-Reply-To: <1318648059-30431-20-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sat, 15 Oct 2011 00:07:34 -0300")
References: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
 <1318648059-30431-20-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87fwiurluj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> * Busybox provides ifplugd, so build after it and make the menu option
 Gustavo>   conditional on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS

You forgot to make the option depend on _SHOW_OTHERS.

-- 
Bye, Peter Korsgaard
