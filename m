From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 15 Oct 2015 20:56:02 +0200
Subject: [Buildroot] [PATCH 2/2] package/ffmpeg: Add optional
	dependencies
References: <1438438841-31219-1-git-send-email-bernd.kuhls@t-online.de>
 <1438438841-31219-2-git-send-email-bernd.kuhls@t-online.de>
 <20151015161109.7684f73b@free-electrons.com>
Message-ID: <2f95fcx73i.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 15 Oct 2015 16:11:09 +0200 schrieb Thomas Petazzoni:

> Dear Bernd Kuhls,
> 
> On Sat,  1 Aug 2015 16:20:41 +0200, Bernd Kuhls wrote:
>> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>> ---
>>  package/ffmpeg/ffmpeg.mk | 60 ++++++++++++++++++++++++++++++++++++++++++++----
>>  1 file changed, 56 insertions(+), 4 deletions(-)
> 
> This seems to break the build:
> 
> http://autobuild.buildroot.org/results/ae0/ae0c4bab7975ed2ad77a9f9fd6a300d1327d56b9/build-end.log

Hi Thomas,

should be fixed by http://patchwork.ozlabs.org/patch/530860/

Regards, Bernd
