From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jan 2021 17:55:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/wavpack: security bump to
 version 5.4.0
In-Reply-To: <20210113064511.120257-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 13 Jan 2021 07:45:11 +0100")
References: <20210113064511.120257-1-fontaine.fabrice@gmail.com>
Message-ID: <87h7nffqq0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > WavPack 5.4.0 contains a fix for CVE-2020-35738 wherein a specially
 > crafted WAV file could cause the WAVPACK command-line program to crash
 > with an out-of-bounds write (see issue #91).

 > Update hash of COPYING (update in year:
 > https://github.com/dbry/WavPack/commit/2ce3c069be548e82ea9c05741ace6583e549c6de)

 > https://github.com/dbry/WavPack/blob/5.4.0/NEWS

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
