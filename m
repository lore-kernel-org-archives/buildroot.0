From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 11 Jan 2020 22:39:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/opencv3: security bump to
 version 3.4.9
In-Reply-To: <20200111160253.1449739-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 11 Jan 2020 17:02:53 +0100")
References: <20200111160253.1449739-1-fontaine.fabrice@gmail.com>
Message-ID: <8736clisf6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2019-14491: An issue was discovered in OpenCV before 3.4.7
 >   and 4.x before 4.1.1. There is an out of bounds read in the function
 >   cv::predictOrdered<cv::HaarEvaluator> in
 >   modules/objdetect/src/cascadedetect.hpp, which leads to denial of service.
 > - Fix CVE-2019-14492: An issue was discovered in OpenCV before 3.4.7
 >   and 4.x before 4.1.1. There is an out of bounds read/write in the
 >   function HaarEvaluator::OptFeature::calc in
 >   modules/objdetect/src/cascadedetect.hpp, which leads to denial of service.
 > - atomic workaround is not needed since version 3.4.8 and
 >   https://github.com/opencv/opencv/commit/464972855e25f71667009b8fe88092d11aab0297
 > - Update hash of license file (Xperience.AI added:
 >   https://github.com/opencv/opencv/commit/766465ce9483c20d54bfce422d285c077f6502bd)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
