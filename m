From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 20:16:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/openjpeg: bump version to 2.3.0
In-Reply-To: <20171021195741.2333df85@gmx.net>
References: <20171015202717.22211-1-bernd.kuhls@t-online.de>
 <20171021175958.56a34929@windsurf>
 <CALdGskJxEYJ-kpm_Seprhk11fQKVoCxv3TLT8_2DTd7K6j99tQ@mail.gmail.com>
 <20171021190120.2652d095@windsurf>
 <20171021195237.7dd23f8d@gmx.net> <20171021195741.2333df85@gmx.net>
Message-ID: <20171021201640.14e8be02@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Oct 2017 19:57:41 +0200, Peter Seiderer wrote:

> > There is a upstream patch handling this error 'gst-plugins-bad: openjpeg:
> > Support building with openjpeg 2.3' ([1]), maybe worth a try?
> >  
> 
> And the actual ones are
>   - 'gst-plugins-bad: Revert "openjpeg: Support building with openjpeg 2.3"' ([2]) 
>   - 'gst-plugins-bad: openjpeg: Remove compatibility with openjpeg 2.0' ([3])
>   - 'gst-plugins-bad: openjpeg: Support building with openjpeg 2.3, simpler' ([4])
> 
> Regards,
> Peter
> 
> [2] https://lists.freedesktop.org/archives/gstreamer-commits/2017-October/103157.html
> [3] https://lists.freedesktop.org/archives/gstreamer-commits/2017-October/103158.html
> [4] https://lists.freedesktop.org/archives/gstreamer-commits/2017-October/103159.html

Will you send a Buildroot patch adding those patches?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
