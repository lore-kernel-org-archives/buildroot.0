From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 09:32:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsigrok: fix comment display
In-Reply-To: <20190508170028.15971-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 8 May 2019 19:00:28 +0200")
References: <20190508170028.15971-1-fontaine.fabrice@gmail.com>
Message-ID: <87y32tn01w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit 922b82bde9d554237769c21e50f6c5b4f73f41a8 added a dependency to
 > locale and updated comment text but forgot to add the !BR2_ENABLE_LOCALE
 > dependency to comment

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
