From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 May 2021 09:52:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/domoticz: needs gcc >= 6
In-Reply-To: <20210510204013.1582476-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 10 May 2021 22:40:13 +0200")
References: <20210510204013.1582476-1-fontaine.fabrice@gmail.com>
Message-ID: <877dk5r9lm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > domoticz fails to build with gcc 5 since bump to version 2021.1 in
 > commit 33b49c4ae33e767b86130cbc1844e2003bbe0f98 because domoticz needs
 > C++14 since
 > https://github.com/domoticz/domoticz/commit/bdf82257dc93daa78b0179a0229539553b608f6b

 > Fixes:
 >  - http://autobuild.buildroot.org/results/f4f9caa44d1836279c3806bc990a1203bf743c0d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
