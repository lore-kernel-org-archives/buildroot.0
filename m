From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jul 2016 12:27:09 +0200
Subject: [Buildroot] [PATCH] libcurl: bump version to 7.50.0
References: <1469100633-54298-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160721135713.0468f67e@free-electrons.com>
Message-ID: <tctb6dxt16.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 21 Jul 2016 13:57:13 +0200 schrieb Thomas Petazzoni:

> Hello,
> 
> On Thu, 21 Jul 2016 12:30:33 +0100, Vicente Olivert Riera wrote:
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>>  package/libcurl/libcurl.hash | 2 +-
>>  package/libcurl/libcurl.mk   | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> Applied to master, thanks.
> 
> Thomas

Hi,

this patch breaks compilation of Kodi:
http://autobuild.buildroot.net/results/bc3/bc392094b5b05f5f4b4ede5ab3a54200d6d33be5//
http://forum.kodi.tv/showthread.php?tid=283382

In my kodi17 branch I reverted the bump
https://github.com/bkuhls/buildroot/commit/b7885476b212b87a7ef38164c9c36d81f16ce882

Regards, Bernd
