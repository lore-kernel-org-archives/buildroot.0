From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 5 Mar 2014 16:01:47 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140305112729.47a9a631@skate>
References: <20140305073008.3DAFE101B04@stock.ovh.net>
 <20140305112729.47a9a631@skate>
Message-ID: <CAHXCMM+2G3zQNkeYBSk8ZUbDgzJ9-U24XnK1-Dxj0pnO47Tomw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 5, 2014 at 11:27 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
[...]
>>        arm |         gst1-plugins-bad-1.2.3 | NOK | http://autobuild.buildroot.net/results/ac98e35736532c697e1c08e23e1d6800c951ea23/
>>        arm |         gst1-plugins-bad-1.2.3 | NOK | http://autobuild.buildroot.net/results/d02e1843ef90f4b40c99e3b23eddf376f827d46e/
>>        arm |         gst1-plugins-bad-1.2.3 | NOK | http://autobuild.buildroot.net/results/51ea53c39e6c067760c2d1e9c0c7b7bfbbe28be8/
>
> OpenCV problem, to be looked at by Samuel I believe:
>
> /home/test/test/3/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/opencv/cv.h:72:37: fatal error: opencv2/legacy/compat.hpp: No such file or directory

Roger that!
I'll look at it soon.

Regards,

-- 
Samuel
