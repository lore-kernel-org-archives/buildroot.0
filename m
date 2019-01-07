From: Wolfgang Grandegger <wg@grandegger.com>
Date: Mon, 7 Jan 2019 11:00:47 +0100
Subject: [Buildroot] Package definition for gst-shark
In-Reply-To: <872f55f9-bcb8-f41d-16d6-ee43f01ff334@grandegger.com>
References: <872f55f9-bcb8-f41d-16d6-ee43f01ff334@grandegger.com>
Message-ID: <919df2b5-18c5-025d-b727-14ddc7dbca2f@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Am 07.01.19 um 10:38 schrieb Wolfgang Grandegger:
> Hello,
> 
> I'm trying to implement a Buildroot package for gst-shark [1]. For
> "autogen.sh", it clones
> 
>   git://anongit.freedesktop.org/gstreamer/common
> 
> into it's source tree using "git submodule init/update". I think copying
> that directory from the build directory of BR2_PACKAGE_GSTREAMER1 would
> do the job. Is there an environment variable pointing to that build
> directory? Or how can I construct the path?
> 
> Any other ideas?

I just found out that "gst1-interpipe" is already doing what I'm looking
for. Sorry for the noise!



> 
> [1] https://developer.ridgerun.com/wiki/index.php?title=GstShark

Wolfgang
