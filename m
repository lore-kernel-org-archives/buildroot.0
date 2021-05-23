From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 May 2021 20:36:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: fix build with
 CVE-2021-30004 changes
In-Reply-To: <20210520201833.GG3208066@scaer> (Yann E. MORIN's message of
 "Thu, 20 May 2021 22:18:33 +0200")
References: <20210520190456.59520-1-geomatsi@gmail.com>
 <20210520201833.GG3208066@scaer>
Message-ID: <87h7it47rk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Sergey, All,
 > On 2021-05-20 22:04 +0300, Sergey Matyukevich spake thusly:
 >> Commit a8fbe67b9b16 ("package/wpa_supplicant: add upstream patch to fix
 >> CVE-2021-30004") added security patch from hostapd upstream without
 >> required ASN.1 helpers. Backport and adapt two commits from the
 >> hostapd upstream to add missing headers and helpers.
 >> 
 >> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

 > Applied to master, thanks.

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
