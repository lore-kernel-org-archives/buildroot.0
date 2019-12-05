From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Dec 2019 19:32:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/oniguruma: security bump to
 version 6.9.4
In-Reply-To: <20191129080951.33195-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 29 Nov 2019 09:09:51 +0100")
References: <20191129080951.33195-1-fontaine.fabrice@gmail.com>
Message-ID: <87v9qufwsj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Retrieve official tarball to drop autoreconf
 > - Fixed CVE-2019-19012
 > - Fixed CVE-2019-19203 (Does not affect UTF-8, UTF-16 and UTF-32
 >   encodings)
 > - Fixed CVE-2019-19204 (Affects only PosixBasic, Emacs and Grep
 >   syntaxes)
 > - Fixed CVE-2019-19246

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
