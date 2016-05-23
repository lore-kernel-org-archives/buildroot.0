From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 23 May 2016 18:28:52 +0200
Subject: [Buildroot] [PATCH next] systemd: bump version to 230
In-Reply-To: <574316D2.5020903@imgtec.com>
References: <1464008187-15431-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160523162800.5dc8b7a5@free-electrons.com> <574316D2.5020903@imgtec.com>
Message-ID: <CAGduivxx794UeWhNNQbUR8HK9WMtADTAfPnoiYiFsmWoZxDTVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Vicente, systemd doesn't include bootchart anymore, it's now a separate package.

I have started a branch about that on my github:
https://github.com/maximeh/buildroot/tree/systemd_bump
I'm in holiday, so I won't have time to look at that before I came
back, so feel free to take any of theses patches, I have already told
that to Yann E. Morin on IRC.

On Mon, May 23, 2016 at 4:42 PM, Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
> Hello Thomas,
>
> I just read this:
>
> http://www.phoronix.com/scan.php?page=news_item&px=Systemd-230-FBDEV-Woe
>
> I don't know how important is this for Buildroot.
>
> Should we revert this commit?
>
> Regards,
>
> Vincent.
>
> On 23/05/16 15:28, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Mon, 23 May 2016 13:56:27 +0100, Vicente Olivert Riera wrote:
>>> We pass "--with-default-dnssec=no" to "configure" as it might create
>>> incompatibilities with a few DNS servers and networks.
>>>
>>> Announcement URL:
>>>
>>>   https://lists.freedesktop.org/archives/systemd-devel/2016-May/036583.html
>>>
>>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>>> ---
>>>  package/systemd/systemd.hash | 2 +-
>>>  package/systemd/systemd.mk   | 3 ++-
>>>  2 files changed, 3 insertions(+), 2 deletions(-)
>>
>> Applied to next, thanks.
>>
>> Thomas
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
