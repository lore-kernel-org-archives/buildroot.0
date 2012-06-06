From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 06 Jun 2012 07:54:58 +0200
Subject: [Buildroot] [PATCH v2 5/5] opencv: bump to version 2.4.0
In-Reply-To: <20120603002007.0c0d01cf@skate>
References: <1338674987-2053-1-git-send-email-s.martin49@gmail.com>
 <1338674987-2053-6-git-send-email-s.martin49@gmail.com>
 <20120603002007.0c0d01cf@skate>
Message-ID: <4FCEF0B2.7090206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/03/12 00:20, Thomas Petazzoni wrote:
> Le Sun,  3 Jun 2012 00:09:47 +0200,
> Samuel Martin<s.martin49@gmail.com>  a ?crit :
>
> > +config BR2_PACKAGE_OPENCV_BUILD_opencv_calib3d
> > +    bool "include opencv_calib3d module into the OpenCV build"
> > +    default y
>
> We normally use capital letters for options names. And the _BUILD_ part
> is, IMO, useless. What about simply:
>
> config BR2_PACKAGE_OPENCV_CALIB3D
>
> or
>
> config BR2_PACKAGE_OPENCV_MODULE_CALIB3D
>
> for this specific case?

  And also the menu text should be abbreviated to "calib3d".  The more verbose
text you have now could be used as a help text.  Even better would be to
include some explanation about what the module does in the help text, but
that's a lot more effort of course.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
