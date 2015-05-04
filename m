From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 4 May 2015 15:28:22 +0200
Subject: [Buildroot] Build issue on OpenCV: multiple Qt related
	undefined references
In-Reply-To: <20150503113551.60d21f26@free-electrons.com>
References: <20150503113551.60d21f26@free-electrons.com>
Message-ID: <CAHXCMM+cbdbMYr0kfy=yP2rcUooaM5-wcv-hPcJsbkJ0hGOU8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, May 3, 2015 at 11:35 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello Samuel,
>
> I did an allyespackageconfig build yesterday, and it failed because of
> an OpenCV/Qt build issue during the OpenCV build. Here is the error:
>
> ../../lib/libopencv_highgui.so.2.4.10: undefined reference to `QFont::setLetterSpacing(QFont::SpacingType, float)'
> ../../lib/libopencv_highgui.so.2.4.10: undefined reference to `QTransform::QTransform(float, float, float, float, float, float, float, float, float)'
> ../../lib/libopencv_highgui.so.2.4.10: undefined reference to `QTransform::map(float, float, float*, float*) const'
> ../../lib/libopencv_highgui.so.2.4.10: undefined reference to `QPen::QPen(QBrush const&, float, Qt::PenStyle, Qt::PenCapStyle, Qt::PenJoinStyle)'
> ../../lib/libopencv_highgui.so.2.4.10: undefined reference to `QTransform::scale(float, float)'
> ../../lib/libopencv_highgui.so.2.4.10: undefined reference to `QTransform::translate(float, float)'
> collect2: error: ld returned 1 exit status
>
> The defconfig is below, but beware, it takes ages to build (200 minutes
> of real time on a relatively fast build server). If you could have a
> look, it would be great.
>
> Thanks!

Thanks for the report.
I'll look at it as soon as time permit, I'll keep you in touch.

Regards,

-- 
Samuel
