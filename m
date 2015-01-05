From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 5 Jan 2015 13:30:38 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-12-13
In-Reply-To: <54AA7DAE.80208@imgtec.com>
References: <20141214073018.09EE8101651@stock.ovh.net>
 <54AA7DAE.80208@imgtec.com>
Message-ID: <CAHXCMMJtAz0ywcGhU=7+BRDMsnz07ygf7gb7z6OEdb4vBmnJiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente, all,

On Mon, Jan 5, 2015 at 1:03 PM, Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
> On 12/14/2014 07:30 AM, Thomas Petazzoni wrote:
>> Build statistics for 2014-12-13
>> ===============================
>
>>       mipsel |         gst1-plugins-bad-1.4.4 | NOK | http://autobuild.buildroot.net/results/427c56580f65ae9452ad68727155097a8df48914/
>
> This is a problem of the opencv.pc file. It contains the full path of
> the libraries instead of strings like '-lopencv_something'. If we fix
> the opencv.pc file, we fix this problem.
>
> There is a bug report opened in almost October here:
>
>   http://code.opencv.org/issues/3931
>
> And Samuel (in CC) did a revision of it. Maybe he has more information
> about how is this going.

I sent a PR[1] a while ago, but still waiting for some answers :-/

BTW, I also have a couple of patches in patchwork, marked as Change
requested, I should rebase, and repost... I just need some spare time
;)


[1] https://github.com/Itseez/opencv/pull/3310


Regards,

>
> Should we fix this in Buildroot if upstream stills not fixing it?
>
> Regards,
> --
> Vicente Olivert Riera
> Graduate Software Engineer, MIPS Platforms
> Imagination Technologies Limited
> t: +44 (0)113 2429814
> www.imgtec.com


-- 
Samuel
