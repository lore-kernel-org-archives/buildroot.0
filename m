From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Apr 2019 17:30:37 +0200
Subject: [Buildroot] [PATCH v2,
 1/8] package/rpm: security bump to 4.14.2.1
In-Reply-To: <20190330144947.27638-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 30 Mar 2019 15:49:40 +0100")
References: <20190330144947.27638-1-fontaine.fabrice@gmail.com>
Message-ID: <87d0m0sc4i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Remove first and second patches (already in version)
 > - Remove third and fourth patches (not needed since:
 >   https://github.com/rpm-software-management/rpm/commit/245b5a3b4b6d616adf47361137987e90f8dab22c)
 > - Add hash for license file
 > - Drop autoreconf (as configure.ac is not patched anymore)
 > - Use new --with-crypto option
 > - Restrict symlink following on installation (CVE-2017-7500,
 >   CVE-2017-7501)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni):
 >  - Put bump as the first patch in the serie

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
