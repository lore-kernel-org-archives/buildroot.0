From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 19 Apr 2016 18:32:18 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/freeswitch: select OpenCV
 modules for needed mod_cv
References: <1461010675-8274-1-git-send-email-bernd.kuhls@t-online.de>
 <1461010675-8274-2-git-send-email-bernd.kuhls@t-online.de>
 <CAHXCMMLOk+xw1cGvhTF7=o025czk20hWD__L6Aa309=TupSzFQ@mail.gmail.com>
Message-ID: <i53iucx3gr.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

Am Tue, 19 Apr 2016 00:11:04 +0200 schrieb Samuel Martin:

>> +       # src/mod/applications/mod_cv/mod_cv.cpp includes cv.h
> ... which includes headers from: core, imgproc, video, feature2d,
> flann, calib3d, objdetect and legacy [1]
> So I would expect to see all these modules selected.

will be included in v4.

>> select BR2_PACKAGE_OPENCV_LIB_HIGHGUI if BR2_PACKAGE_OPENCV
> Is highgui included as well in mod_cv?

Yes: https://freeswitch.org/stash/projects/FS/repos/freeswitch/browse/src/
mod/applications/mod_cv/mod_cv.cpp?at=refs%2Fheads%2Fv1.6#46

Regards, Bernd
