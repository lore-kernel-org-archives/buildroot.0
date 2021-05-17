From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 21:26:07 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/libxslt: fix build with latest libxml2
In-Reply-To: <20210514202838.2260096-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 14 May 2021 22:28:38 +0200")
References: <20210514202838.2260096-1-fontaine.fabrice@gmail.com>
Message-ID: <87zgwtkvqo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build is broken since bump of libxml2 to version 2.9.11 in commit
 > a241dcec4188dbf30fbc8b65d7e6f2ece9da3d04 because libxslt calls the
 > following command "${XML_CONFIG} --libs print" which will return an
 > error code since
 > https://github.com/GNOME/libxml2/commit/2a357ab99e6f5c9196384b11cd91dd993f93014c

 > Fixes:
 >  - http://autobuild.buildroot.org/results/47ceb8c24c9ead8a450b7fea3266f760d6b77b4f

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Peter Seiderer):
 >  - Use upstream patch instead of dropping --with-libxml-prefix

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
