From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 May 2016 09:33:23 +0200
Subject: [Buildroot] [PATCH 1/2] hostapd: add security fix
In-Reply-To: <a33b448fd0611e1ff359de562e180e59a2d062e6.1462257619.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 3 May 2016 09:40:18 +0300")
References: <a33b448fd0611e1ff359de562e180e59a2d062e6.1462257619.git.baruch@tkos.co.il>
Message-ID: <87wpnbppdo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add upstream patch fixing CVE-2016-2447: psk configuration parameter
 > update
 > allowing arbitrary data to be written.

 > See http://w1.fi/security/2016-1/psk-parameter-config-update.txt for
 > details.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
