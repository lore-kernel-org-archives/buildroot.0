From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Aug 2019 16:40:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to
 version 2.24.3
In-Reply-To: <20190830141528.16446-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Fri, 30 Aug 2019 17:15:28 +0300")
References: <20190830141528.16446-1-aperez@igalia.com>
Message-ID: <87tv9yiunz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > This is a minor release which includes fixes for CVE-2019-8644,
 > CVE-2019-8649, CVE-2019-8658, CVE-2019-8666, CVE-2019-8669,
 > CVE-2019-8673, CVE-2019-8676, CVE-2019-8678, CVE-2019-8680,
 > CVE-2019-8681, CVE-2019-8683, CVE-2019-8684, CVE-2019-8687,
 > CVE-2019-8688, CVE-2019-8689, and CVE-2019-8690.

 > This release also contains many build fixes, a few media playback
 > improvements, and a Web compatibility fix. For a complete list,
 > the full release notes are available at:

 >   https://wpewebkit.org/release/wpewebkit-2.24.3.html

 > The detailed security advisory can be found at:

 >   https://wpewebkit.org/security/WSA-2019-0004.html

 > Patch "0001-Build-failure-after-r243644-in-GTK-Li.patch" is now
 > unneeded because it is one of the build included in this release.

s/build/build fixes/

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
