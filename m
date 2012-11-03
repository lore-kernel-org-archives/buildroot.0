From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 Nov 2012 19:15:39 +0100
Subject: [Buildroot] [PATCHv2 00/12] Netfilter bumps and additions
In-Reply-To: <1351600193-21511-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 30 Oct 2012 09:29:41 -0300")
References: <1351600193-21511-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <871ugay2lw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> v1 -> v2
 Gustavo> Fixed Config.in wrapping in libnetfilter_cthelper as pointed by Thomas.
 Gustavo> Switch from host-pkg-config to host-pkgconf for relevant packages.

 Gustavo> Gustavo Zacarias (12):
 Gustavo>   libnetfilter_conntrack: bump to version 1.0.2
 Gustavo>   libnetfilter_cttimeout: add license info
 Gustavo>   libnfnetlink: bump to version 1.0.1
 Gustavo>   libnetfilter_cthelper: add new package
 Gustavo>   libnetfilter_queue: add new package
 Gustavo>   libnetfilter_acct: add new package
 Gustavo>   libmnl: add license info
 Gustavo>   libnetfilter_log: add new package
 Gustavo>   nfacct: add new package
 Gustavo>   conntrack-tools: bump to version 1.4.0
 Gustavo>   ulogd: add new package
 Gustavo>   arptables: add new package

Committed entire series, thanks.

-- 
Bye, Peter Korsgaard
