From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 18:50:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: security bump to
 version 9.52
In-Reply-To: <20200817185109.3051830-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 17 Aug 2020 20:51:09 +0200")
References: <20200817185109.3051830-1-fontaine.fabrice@gmail.com>
Message-ID: <87y2lyr9xx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix a bunch of CVEs: CVE-2020-16287, CVE-2020-16288, CVE-2020-16289,
 > CVE-2020-16290, CVE-2020-16291, CVE-2020-16292, CVE-2020-16293,
 > CVE-2020-16294, CVE-2020-16295, CVE-2020-16296, CVE-2020-16297,
 > CVE-2020-16298, CVE-2020-16299, CVE-2020-16300, CVE-2020-16301,
 > CVE-2020-16302, CVE-2020-16303, CVE-2020-16304, CVE-2020-16305
 > CVE-2020-16308, CVE-2020-16309, CVE-2020-17538

 > PKGCONFIG must be passed since version 9.51 and
 > https://github.com/ArtifexSoftware/ghostpdl/commit/2d84ecc57837785b566ebd9d5909ba9edc9d697f

 > Also drop patch (already in version) and update indentation in hash file
 > (two spaces)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
