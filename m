From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2020 11:41:55 +0200
Subject: [Buildroot] [PATCHv2 1/2] Revert "package/supertux: fix build
 with RELRO"
In-Reply-To: <20201003232256.549688-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 4 Oct 2020 01:22:55 +0200")
References: <20201003232256.549688-1-romain.naour@gmail.com>
Message-ID: <87v9fqs4yk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > This reverts commit 80be040817e008a021219bf4423df7550723d912 because
 > libsquirrel.so.0 and libsqstdlib.so.0 are missing in TARGET_DIR.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
