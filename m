From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 26 Oct 2013 19:09:17 +0200
Subject: [Buildroot] [PATCH v2 1/6] qt5: bump to 5.1.1
In-Reply-To: <1379655795-22429-2-git-send-email-fatih.asici@gmail.com> ("Fatih
 =?utf-8?B?QcWfxLFjxLEiJ3M=?= message of "Fri, 20 Sep 2013 08:43:10 +0300")
References: <1379655795-22429-1-git-send-email-fatih.asici@gmail.com>
 <1379655795-22429-2-git-send-email-fatih.asici@gmail.com>
Message-ID: <87zjpwyn5u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fatih" == Fatih A??c? <fatih.asici@gmail.com> writes:

 > Following patches are removed since they are upstreamed:
 >   - qt5base/qt5base-0001-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch
 >   - qt5jsbackend/qt5jsbackend-0002-fix-uclibc.patch

 > Remove "-nomake demos" from configure options since "demos" directory is
 > merged into examples.

Committed, thanks.

-- 
Bye, Peter Korsgaard
