From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Nov 2020 20:57:17 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/wireshark: bump to version 3.4.0
In-Reply-To: <20201102195737.81319-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 2 Nov 2020 20:57:37 +0100")
References: <20201102195737.81319-1-fontaine.fabrice@gmail.com>
Message-ID: <87r1pa5i3m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - c-ares is mandatory since
 >   https://github.com/wireshark/wireshark/commit/451a241e50bd34ba097bd09a5f9f673170779aaf
 > - Disable ilibc which is available and enabled by default since
 >   https://github.com/wireshark/wireshark/commit/12a13a69264fdef4281e4b13c8c7d92a272cc99e
 > - LTO can be enabled since
 >   https://github.com/wireshark/wireshark/commit/e6b5bd09766a1320c5540f78eb0e4ba03ce8f108
 > - opus is an optional dependency since
 >   https://github.com/wireshark/wireshark/commit/6136c719da4ec9b96c01adb4b0fd7f01af171688

 > https://www.wireshark.org/docs/relnotes/wireshark-3.4.0.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Petr Vorel):
 >  - c-ares is now mandatory

Committed, thanks.

-- 
Bye, Peter Korsgaard
