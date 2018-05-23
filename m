From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 23 May 2018 05:27:13 +0300
Subject: [Buildroot] opkg updates?
In-Reply-To: <SN6PR02MB3998C6D077D67B6C8CF724E9F2940@SN6PR02MB3998.namprd02.prod.outlook.com>
References: <SN6PR02MB3998B8B8B748380B25E9087DF2940@SN6PR02MB3998.namprd02.prod.outlook.com>
 <20180522161954.a6d5l3kftp76c3da@tarshish>
 <SN6PR02MB3998C6D077D67B6C8CF724E9F2940@SN6PR02MB3998.namprd02.prod.outlook.com>
Message-ID: <20180523022713.qykzwdpvwz7phern@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Derek,

On Tue, May 22, 2018 at 07:10:35PM +0000, Baker, Derek wrote:
> Did you just patch it? If so that's amazing and thanks so much :)

Peter committed the opkg version bump to the 'next' branch, so it should be in 
the 2018.08 release.

  https://git.buildroot.org/buildroot/commit/?h=next&id=879aada6c6c4b0331f6231582032f66bd82a3104

baruch

> From: Baruch Siach <baruch@tkos.co.il>
> Sent: Tuesday, May 22, 2018 12:19:54 PM
> To: Baker, Derek
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] opkg updates?
> 
> Hi Derek,
> 
> On Tue, May 22, 2018 at 03:46:05PM +0000, Baker, Derek wrote:
> > We've determined that having a more recent version of opkg would make our
> > lives easier, but notice that the opkg version that ships with buildroot is
> > quite old. Are there plans to update that to a more recent version? If not,
> > can someone explain why so I can pass that on to my team? If there are plans
> > to update it, can someone let me know when that might happen?
> 
> opkg has not been updated because nobody sent a patch for doing so. Feel free
> to post a version bump patch to this list.
> 
> We are now in the -rc stage of the upcoming 2018.05 release. Version bump
> patches are applied to the 'next' branch. They will be included in the 2018.08
> release.
> 
> baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
