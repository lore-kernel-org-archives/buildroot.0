From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 26 Mar 2016 21:57:41 +0100
Subject: [Buildroot] [PATCH 3/3] ffmpeg: default to --cpu=generic for
 MIPS architecture
References: <1458309966-16835-1-git-send-email-Vincent.Riera@imgtec.com>
 <1458309966-16835-3-git-send-email-Vincent.Riera@imgtec.com>
 <20160319143556.34d7b41a@free-electrons.com>
Message-ID: <5n9jscxh1d.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 19 Mar 2016 14:35:56 +0100 schrieb Thomas Petazzoni:

> Dear Vicente Olivert Riera,
> 
> On Fri, 18 Mar 2016 14:06:06 +0000, Vicente Olivert Riera wrote:
>> Signed-off-by: Vicente Olivert Riera
>> <Vincent.Riera@imgtec.com>
>> ---
>>  package/ffmpeg/ffmpeg.mk | 5 +++++
>>  1 file changed, 5 insertions(+)
> 
> Why ? Your commit log only says what the patch is doing, but not why.

Hi Thomas,

this patch prevents this message from ffmpeg configure:

WARNING: unknown CPU. Disabling all MIPS optimizations.

I will add a description about this in my re-spin of Vicentes patch 
series. Please note that the ffmpeg 3.0 bump will not only need updates 
for Kodi but also libdcadec, mediastreamer, opencv, opencv3, squeezelite 
and freerdp; all of them are currently part of my WIP patch series.

Regards, Bernd
