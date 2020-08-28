From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:51:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/shadowsocks-libev: security
 bump to version 3.3.4
In-Reply-To: <20200827211003.217299-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 27 Aug 2020 23:10:03 +0200")
References: <20200827211003.217299-1-fontaine.fabrice@gmail.com>
Message-ID: <87y2lymzg0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2019-5163: An exploitable denial-of-service vulnerability
 >   exists in the UDPRelay functionality of Shadowsocks-libev 3.3.2. When
 >   utilizing a Stream Cipher and a local_address, arbitrary UDP packets
 >   can cause a FATAL error code path and exit. An attacker can send
 >   arbitrary UDP packets to trigger this vulnerability.
 > - Fix CVE-2019-5164: An exploitable code execution vulnerability exists
 >   in the ss-manager binary of Shadowsocks-libev 3.3.2. Specially crafted
 >   network packets sent to ss-manager can cause an arbitrary binary to
 >   run, resulting in code execution and privilege escalation. An attacker
 >   can send network packets to trigger this vulnerability.

 > Also update indentation in hash file (two spaces)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
