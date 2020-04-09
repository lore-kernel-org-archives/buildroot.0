From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 09 Apr 2020 09:46:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/haproxy: security bump to
 version 2.1.4
In-Reply-To: <20200408210006.540664-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 8 Apr 2020 23:00:06 +0200")
References: <20200408210006.540664-1-fontaine.fabrice@gmail.com>
Message-ID: <87zhblf6ev.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2020-11100: In hpack_dht_insert in hpack-tbl.c in the HPACK
 >   decoder in HAProxy 1.8 through 2.x before 2.1.4, a remote attacker can
 >   write arbitrary bytes around a certain location on the heap via a
 >   crafted HTTP/2 request, possibly causing remote code execution.
 > - Update indentation of hash file (two spaces)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x (1.9.15), 2019.11.x (2.0.14) and 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
