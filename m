From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 12 Feb 2014 12:25:39 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140212093245.49e2b6ac@skate>
References: <20140212073007.B3242100CEB@stock.ovh.net>
 <20140212093245.49e2b6ac@skate>
Message-ID: <CAHXCMML8Ag5eWSUkGdOWVopiZXPaTkHVtL4ngLJixRh7Tbt-uw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all,

On Wed, Feb 12, 2014 at 9:32 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> As usual, analysis of yesterday build failures.
>
> On Wed, 12 Feb 2014 08:30:07 +0100 (CET), Thomas Petazzoni wrote:
[...]
>>       i686 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/39c77ffb5a5599d0b09422433c747b2bac185c4f/
>
>   CXX      libopencv_example_plugin_la-opencv_example.lo
> opencv_example.cpp:42:33: fatal error: opencv2/core/core_c.h: No such file or directory

I'll look into this.

Regards,

-- 
Samuel
