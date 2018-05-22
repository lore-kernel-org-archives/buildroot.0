From: Baker, Derek <Derek-Baker@idexx.com>
Date: Tue, 22 May 2018 19:10:35 +0000
Subject: [Buildroot] opkg updates?
In-Reply-To: <20180522161954.a6d5l3kftp76c3da@tarshish>
References: <SN6PR02MB3998B8B8B748380B25E9087DF2940@SN6PR02MB3998.namprd02.prod.outlook.com>,
 <20180522161954.a6d5l3kftp76c3da@tarshish>
Message-ID: <SN6PR02MB3998C6D077D67B6C8CF724E9F2940@SN6PR02MB3998.namprd02.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Did you just patch it? If so that's amazing and thanks so much :)

________________________________
From: Baruch Siach <baruch@tkos.co.il>
Sent: Tuesday, May 22, 2018 12:19:54 PM
To: Baker, Derek
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] opkg updates?

Hi Derek,

On Tue, May 22, 2018 at 03:46:05PM +0000, Baker, Derek wrote:
> We've determined that having a more recent version of opkg would make our
> lives easier, but notice that the opkg version that ships with buildroot is
> quite old. Are there plans to update that to a more recent version? If not,
> can someone explain why so I can pass that on to my team? If there are plans
> to update it, can someone let me know when that might happen?

opkg has not been updated because nobody sent a patch for doing so. Feel free
to post a version bump patch to this list.

We are now in the -rc stage of the upcoming 2018.05 release. Version bump
patches are applied to the 'next' branch. They will be included in the 2018.08
release.

baruch

--
     https://urldefense.proofpoint.com/v2/url?u=http-3A__baruch.siach.name_blog_&d=DwIBAg&c=2do6VJGs3LvEOe4OFFM1bA&r=2cGoUGRUBJn6vjecr5REb55imndy_EHk-DK709CIEwQ&m=qv8lccTBJf76eVMzOr0Tt_EqEs_Dp_yRnnS3b8GnLeg&s=fzRnD_l-bTlK3nRj2Wq49wyHv-LUR48EnobH4zRQ7Uw&e=                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, https://urldefense.proofpoint.com/v2/url?u=http-3A__www.tkos.co.il&d=DwIBAg&c=2do6VJGs3LvEOe4OFFM1bA&r=2cGoUGRUBJn6vjecr5REb55imndy_EHk-DK709CIEwQ&m=qv8lccTBJf76eVMzOr0Tt_EqEs_Dp_yRnnS3b8GnLeg&s=-YhxQvYDl1Uj1M-ZvyKRbDtq2MHq86k5ALWId33ISJ4&e= -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180522/3f0ef337/attachment.html>
