From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 20 Aug 2016 08:36:26 -0300
Subject: [Buildroot] [PATCH 1/6] gstreamer1: bump to version 1.8.3
In-Reply-To: <20160820114702.32a641f0@free-electrons.com>
References: <1471654592-16644-1-git-send-email-gustavo@zacarias.com.ar>
 <20160820114702.32a641f0@free-electrons.com>
Message-ID: <dc9b63f4-9b0f-38c5-e513-23ee3ba1737a@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/08/16 06:47, Thomas Petazzoni wrote:

> Hello,
>
> On Fri, 19 Aug 2016 21:56:27 -0300, Gustavo Zacarias wrote:
>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>> ---
>>  package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
>>  package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> Series applied to next, thanks.
>
> Thomas

Hi, thanks.
Just to keep everyone on the loop, gst1-libav wasn't bumped on purpose - 
it doesn't build against ffmpeg 2.x without a small patch, and even with 
that patch it seems to have issues with audio, so probably pending the 
bump to ffmpeg 3.x
I've already asked on the gstreamer-devel mailing list if system ffmpeg 
isn't (again) recommended since the bundled version was bumped.
Regards.
