From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 May 2016 09:33:31 +0200
Subject: [Buildroot] [PATCH 2/2] wpa_supplicant: add security fixes
In-Reply-To: <badade66af4f20865100911c1669d5f68a3984a9.1462257619.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 3 May 2016 09:40:19 +0300")
References: <a33b448fd0611e1ff359de562e180e59a2d062e6.1462257619.git.baruch@tkos.co.il>
 <badade66af4f20865100911c1669d5f68a3984a9.1462257619.git.baruch@tkos.co.il>
Message-ID: <87shxzppdg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add upstream patching fixing CVE-2016-2447: psk configuration
 > parameter update
 > allowing arbitrary data to be written.

 > See http://w1.fi/security/2016-1/psk-parameter-config-update.txt for
 > details.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
