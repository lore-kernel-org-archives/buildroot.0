From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 19 Aug 2019 15:49:59 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-08-18
In-Reply-To: <20190819054333.566812D8079@tinkie.tkos.co.il>
References: <20190819054333.566812D8079@tinkie.tkos.co.il>
Message-ID: <20190819124959.quvccga35p2ggkrf@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

The list of packages versions in Buildroot seems to be take from the master 
branch. All these packages were updated in the next branch. I think that when 
the next branch is active (i.e. has commits not in master), the script should 
look there instead of master.

baruch

On Mon, Aug 19, 2019 at 06:15:54AM -0000, Thomas Petazzoni wrote:
> Outdated packages
> =================
> 
> This is the list of packages for which a new version has been detected
> and for which you are a registered developer. Please help us improving
> the quality of Buildroot by bumping these packages to their latest
> version. Thanks!
> 
>              name              | found by |        link to release-monitoring.org        |   version    |   upstream  
> -------------------------------+----------+----------------------------------------------+--------------+--------------
>                       openipmi |  GUESS   | https://release-monitoring.org/project/02549 | 2.0.24       | 2.0.27      
>                          socat |  GUESS   | https://release-monitoring.org/project/04848 | 1.7.3.2      | 1.7.3.3     
>                         strace |  DISTRO  | https://release-monitoring.org/project/04897 | 5.0          | 5.2         
> 

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
