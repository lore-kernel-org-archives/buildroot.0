From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2020 11:29:57 +0100
Subject: [Buildroot] [PATCH 1/2] package/slirp: security bump to version
 4.3.1
In-Reply-To: <20201107185256.1175545-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 7 Nov 2020 19:52:55 +0100")
References: <20201107185256.1175545-1-fontaine.fabrice@gmail.com>
Message-ID: <87eekwcjtm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Use an up to date fork (spice slirp is archived and has not been
 >   updated since 2012)
 > - Add COPYRIGHT as the license file
 > - BSD-4-Clause has been replaced by BSD-3-Clause since
 >   https://gitlab.freedesktop.org/slirp/libslirp/-/commit/3bac39137a652b24b89d5b9e2a39600619fbe1d3
 >   https://gitlab.freedesktop.org/slirp/libslirp/-/commit/f9f6e69c4e1d9a43af30bfe791b31789ffa04954
 > - Add hash file
 > - Switch to meson-package
 > - Fix multiple security vulnerabilities: CVE-2014-3640, CVE-2017-11434,
 >   CVE-2019-6778, CVE-2019-9824, CVE-2019-14378 and CVE-2020-10756

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
