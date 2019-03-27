From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 10:46:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/cups: security bump to version
 2.2.10
In-Reply-To: <20190316133648.12222-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 16 Mar 2019 14:36:48 +0100")
References: <20190316133648.12222-1-fontaine.fabrice@gmail.com>
Message-ID: <87ef6stzsp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fixes CVE-2018-4700: Linux session cookies used a predictable random
 >   number seed: https://github.com/apple/cups/releases/tag/v2.2.10.
 > - Remove fifth patch (already in version)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.02.x, 2018.11.x and 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
