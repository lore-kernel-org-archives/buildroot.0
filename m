From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 Jun 2021 09:09:35 +0200
Subject: [Buildroot] [PATCH] package/hostapd: add upstream patch to fix
 CVE-2021-27803
In-Reply-To: <11b326bb-8425-7615-f4bc-ce380dcadbf8@mind.be> (Arnout
 Vandecappelle's message of "Tue, 1 Jun 2021 23:06:03 +0200")
References: <20210601180915.14897-1-sam.voss@collins.com>
 <20210601200043.GA168928@scaer>
 <11b326bb-8425-7615-f4bc-ce380dcadbf8@mind.be>
Message-ID: <87y2bnxyds.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> Could you look at providing a patch to wpa_supplicant for
 >> CVE-2021-27803, please?

 >  Peter already applied it in 9ada4eb2f1c3d67ee49f6f5466738bcd821fc647, at the
 > time there was no CVE yet. Fabrice later added the exception for CVE-2021-27803
 > in 1a7cf592a834357c5777e452f0b7ab7652e7d389.

Indeed. I did not add it to hostapd at the time, as the issue (to my
reading at least) is specific to wpa_supplicant.

Why are we adding it to hostapd here? Just for consistency?

-- 
Bye, Peter Korsgaard
