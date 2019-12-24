From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 24 Dec 2019 15:38:32 +0200
Subject: [Buildroot] [PATCH] [PATCH] package/tio: new package
In-Reply-To: <20191224141451.521e9123@windsurf>
References: <20191222221203.1990-1-sergio.prado@e-labworks.com>
 <20191223055102.lfw56utpgqalw2we@sapphire.tkos.co.il>
 <20191224141451.521e9123@windsurf>
Message-ID: <87h81p4zdz.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Dec 24 2019, Thomas Petazzoni wrote:
> On Mon, 23 Dec 2019 07:51:02 +0200
> Baruch Siach <baruch@tkos.co.il> wrote:
>
>> > +TIO_LICENSE = GPLv2  
>> 
>> The LICENSE file has the "or any later version" language. Also, we prefer the 
>> SPDX license identifiers. So "GPL-2.0+".
>
> Fixed when applying.
>
>> > +TIO_LICENSE_FILES = COPYING  
>> 
>> Should also add "LICENSE".
>
> There was no file named "LICENSE" in the source code, so I'm not sure
> what your suggestion was. Did you suggest to add README instead maybe ?

Is see this here:

  https://github.com/tio/tio/blob/master/LICENSE

According to the log this file has been there since 2016.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
