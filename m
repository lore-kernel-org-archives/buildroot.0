From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 21:44:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/tinydtls: security bump to
 version 0.9-rc1
In-Reply-To: <20200615203150.1052024-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 15 Jun 2020 22:31:50 +0200")
References: <20200615203150.1052024-1-fontaine.fabrice@gmail.com>
Message-ID: <878sfkzhq0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Switch site to github
 > - License is now EPL-1.0 or EDLv1.0 as specified in the new LICENSE file
 > - Update indentation of hash file (two spaces)
 > - Drop first patch (already in version) and second patch (not needed since
 >   https://github.com/eclipse/tinydtls/commit/f1ff324a4d1cc14dc6e1c3a88ea16f0242e106de)
 > - Fix CVE-2017-7243 as specified in
 >   https://github.com/eclipse/tinydtls/issues/12 as well as other
 >   security issues:
 >   https://github.com/eclipse/tinydtls/commit/68a1cdaff9e329e13ea59529f1eb61b05632c297
 >   https://github.com/eclipse/tinydtls/commit/494a40dfbb174930ca616e560532d52549736b42
 >   https://github.com/eclipse/tinydtls/commit/2d9f0a82377277af1be8d559d18e30477d63e8ec

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
