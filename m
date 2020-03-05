From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Mar 2020 16:43:15 +0100
Subject: [Buildroot] [PATCH 2/2] package/libsndfile: fix CVE-2019-3832
In-Reply-To: <20200304222103.1029879-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 4 Mar 2020 23:21:03 +0100")
References: <20200304222103.1029879-1-fontaine.fabrice@gmail.com>
 <20200304222103.1029879-2-fontaine.fabrice@gmail.com>
Message-ID: <87zhcuaju4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > It was discovered the fix for CVE-2018-19758 (libsndfile) was not
 > complete and still allows a read beyond the limits of a buffer in
 > wav_write_header() function in wav.c. A local attacker may use this flaw
 > to make the application crash.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
