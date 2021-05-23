From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 May 2021 20:28:07 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/hostapd: fix build with
 CVE-2021-30004 changes
In-Reply-To: <20210520091505.GY2268078@scaer> (Yann E. MORIN's message of
 "Thu, 20 May 2021 11:15:05 +0200")
References: <20210520054853.15608-1-geomatsi@gmail.com>
 <20210520091505.GY2268078@scaer>
Message-ID: <877djp5mq0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Sergey, All,
 > On 2021-05-20 08:48 +0300, Sergey Matyukevich spake thusly:
 >> Commit d65586f45a22 ("package/hostapd: add upstream patch to fix
 >> CVE-2021-30004") added security patch from hostapd upstream without
 >> required ASN.1 helpers. Backport and adapt two commits from the
 >> hostapd upstream to add missing headers and helpers.
 >> 
 >> Fixes:
 >> http://autobuild.buildroot.net/results/8f56cf556efbf447633ce873a21635f5adbc3cd2/
 >> 
 >> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

 > Applied to master, thanks.

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
