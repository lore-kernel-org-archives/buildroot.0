From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 23 May 2016 15:42:26 +0100
Subject: [Buildroot] [PATCH next] systemd: bump version to 230
In-Reply-To: <20160523162800.5dc8b7a5@free-electrons.com>
References: <1464008187-15431-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160523162800.5dc8b7a5@free-electrons.com>
Message-ID: <574316D2.5020903@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

I just read this:

http://www.phoronix.com/scan.php?page=news_item&px=Systemd-230-FBDEV-Woe

I don't know how important is this for Buildroot.

Should we revert this commit?

Regards,

Vincent.

On 23/05/16 15:28, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 23 May 2016 13:56:27 +0100, Vicente Olivert Riera wrote:
>> We pass "--with-default-dnssec=no" to "configure" as it might create
>> incompatibilities with a few DNS servers and networks.
>>
>> Announcement URL:
>>
>>   https://lists.freedesktop.org/archives/systemd-devel/2016-May/036583.html
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>>  package/systemd/systemd.hash | 2 +-
>>  package/systemd/systemd.mk   | 3 ++-
>>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> Applied to next, thanks.
> 
> Thomas
> 
