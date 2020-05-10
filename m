From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2020 21:31:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/squid: security bump to version
 4.11
In-Reply-To: <20200506201541.347759-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 6 May 2020 22:15:41 +0200")
References: <20200506201541.347759-1-fontaine.fabrice@gmail.com>
Message-ID: <87y2pzsi2u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2020-11945: An issue was discovered in Squid before 5.0.2. A
 > remote attacker can replay a sniffed Digest Authentication nonce to gain
 > access to resources that are otherwise forbidden. This occurs because
 > the attacker can overflow the nonce reference counter (a short integer).
 > Remote code execution may occur if the pooled token credentials are
 > freed (instead of replayed as valid credentials).

 > http://www.squid-cache.org/Advisories/SQUID-2020_4.txt

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
