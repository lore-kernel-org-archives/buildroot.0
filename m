From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 14:43:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/unbound: security bump to
 version 1.13.0
In-Reply-To: <20201212215558.29057-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 12 Dec 2020 22:55:58 +0100")
References: <20201212215558.29057-1-fontaine.fabrice@gmail.com>
Message-ID: <8735zzp945.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This version has fixes to connect for UDP sockets, slowing down
 > potential ICMP side channel leakage. The fix can be controlled with the
 > option udp-connect: yes, it is enabled by default.

 > Additionally CVE-2020-28935 is fixed, this solves a problem where the
 > pidfile is altered by a symlink, and fails if a symlink is encountered.
 > See https://nlnetlabs.nl/downloads/unbound/CVE-2020-28935.txt for more
 > information.

 > https://github.com/NLnetLabs/unbound/releases/tag/release-1.13.0

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.08.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
