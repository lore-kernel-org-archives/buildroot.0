From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Dec 2020 22:39:54 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/bind: fix license hash
In-Reply-To: <20201119221140.15637-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 19 Nov 2020 23:11:40 +0100")
References: <20201119221140.15637-1-fontaine.fabrice@gmail.com>
Message-ID: <87pn3tyzmd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit 9679d3f0218519ea7a01f3b5fefb7f6dd23b138e forgot to update hash of
 > COPYRIGHT which was updated to replace http by https:
 > https://gitlab.isc.org/isc-projects/bind9/-/commit/400171aee8db87c3973987980327051a58a20a80

 > Fixes:
 >  - http://autobuild.buildroot.org/results/db614a6fa1e17af2fa5c1d4a0d51cdf770893ca9

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
