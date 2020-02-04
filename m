From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Feb 2020 22:32:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/whois: add host-pkgconf
 mandatory dependency
In-Reply-To: <20200204175434.2887526-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 4 Feb 2020 18:54:34 +0100")
References: <20200204175434.2887526-1-fontaine.fabrice@gmail.com>
Message-ID: <87h806xclr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > pkg-config is used to check if libidn2 is available since version 5.2.18
 > and
 > https://github.com/rfc1036/whois/commit/e20b8bbab3687aa26294bc3c443b4a43292b7636

 > This can lead to a build failure if a broken libidn2.pc is found on host
 > so add a mandatory host-pkgconf dependency and drop our manual handling
 > of HAVE_LIBIDN2 option (which does not exist anymore)

 > Fixes:
 >  - http://autobuild.buildroot.org/results/6cd0dd779d72b7162943f0f7dbb4e7d258b463eb

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
