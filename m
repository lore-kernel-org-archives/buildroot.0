From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 22:24:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5base: fix build with gcc
 11
In-Reply-To: <20210603055644.333578-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 3 Jun 2021 07:56:44 +0200")
References: <20210603055644.333578-1-fontaine.fabrice@gmail.com>
Message-ID: <87mtrxh3j3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with gcc 11:
 > /data/buildroot-autobuilder/instance-0/output-1/build/qt5base-5.15.2/include/QtCore/../../src/corelib/global/qfloat16.h:300:7: error: 'numeric_limits' is not a class template
 >   300 | class numeric_limits<QT_PREPEND_NAMESPACE(qfloat16)> : public numeric_limits<float>
 >       |       ^~~~~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/9a7a987af40b8408ccdfcae4890008c7090b41a1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
