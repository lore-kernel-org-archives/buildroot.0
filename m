From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 7 Jun 2018 09:24:28 +0300
Subject: [Buildroot] [PATCH v4 1/1] flatcc: new package
In-Reply-To: <20180607080236.14fff0db@windsurf>
References: <1527786269-11147-1-git-send-email-joel.carlson@cosmicaes.com>
 <20180607080236.14fff0db@windsurf>
Message-ID: <20180607062428.ezsojfauuxs56fcr@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Joel,

On Thu, Jun 07, 2018 at 08:02:36AM +0200, Thomas Petazzoni wrote:
> On Thu, 31 May 2018 11:04:29 -0600, Joel Carlson wrote:
> > This adds flatcc as a new package, pulling v0.5.1 from github. flatcc
> > has both a host tool (the compiler), and libraries for the target.
> > 
> > Signed-off-by: Steve deRosier <steve.derosier@lairdtech.com>
> > Signed-off-by: Joel Carlson <joel.carlson@cosmicaes.com>
> > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> This package fails to build on machines with gcc 8.x:
> 
>   http://autobuild.buildroot.net/results/8aa/8aa326212dc59ce88d6b5461cb196473f47b56a0/build-end.log
> 
> Could you have a look and send a patch to fix this problem ?

This issue is being discussed upstream:

  https://github.com/dvidelabs/flatcc/pull/86

It is more tricky than it looks.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
