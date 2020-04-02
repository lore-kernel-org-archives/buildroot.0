From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 02 Apr 2020 21:54:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: fix
 CVE-2019-16275
In-Reply-To: <20200330215500.1360335-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 30 Mar 2020 23:55:00 +0200")
References: <20200330215500.1360335-1-fontaine.fabrice@gmail.com>
Message-ID: <87d08p8xyq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > hostapd before 2.10 and wpa_supplicant before 2.10 allow an incorrect
 > indication of disconnection in certain situations because source address
 > validation is mishandled. This is a denial of service that should have
 > been prevented by PMF (aka management frame protection). The attacker
 > must send a crafted 802.11 frame from a location that is within the
 > 802.11 communications range.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
