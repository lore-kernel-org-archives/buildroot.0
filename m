From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Mon, 13 Jul 2015 07:25:17 -0500
Subject: [Buildroot] [PATCH v8 11/16] rsyslog: fix config file comment
	style
In-Reply-To: <20150713005110.1d841a70@free-electrons.com>
References: <1436570882-56442-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1436570882-56442-12-git-send-email-clayton.shotwell@rockwellcollins.com>
 <20150713005110.1d841a70@free-electrons.com>
Message-ID: <CANn-YGSg5V5RyPGi2w47aZ-c_Uex=+Weiu2drDDF2G79UY1OZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, Jul 12, 2015 at 5:51 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Clayton Shotwell,
>
> On Fri, 10 Jul 2015 18:27:57 -0500, Clayton Shotwell wrote:
>> From: Matt Weber <matthew.weber@rockwellcollins.com>
>>
>> The upstream versions of rsyslog (v8 and higher) have this commit to fix
>> the config file comment issue. Carry this patch here until the version
>> is bumped.
>>
>> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
>
> I had to revert this patch, because it was breaking the build:
>
>    http://autobuild.buildroot.org/results/208/2082f4e8dc5768b03c951f571b9aca976703f952/build-end.log
>
> Indeed the patch you proposed to add to rsyslog is already part of
> rsyslog 8.9.0 which we use in Buildroot.
>
> Which means you sent this patch without even trying to apply it on
> rsyslog. Bad! :-)

You are correct. My bad. That is what I get for trying to rush things
before heading out on a Friday.

Thanks,
Clayton

Clayton Shotwell
Senior Software Engineer, Rockwell Collins
clayton.shotwell at rockwellcollins.com
