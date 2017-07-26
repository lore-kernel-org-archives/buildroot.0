From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 26 Jul 2017 06:49:51 +0300
Subject: [Buildroot] [PATCH] linux-zigbee: fix build with gcc 7
In-Reply-To: <878tjcyy21.fsf@dell.be.48ers.dk>
References: <dec68ad1059ce87fa42de8b4c15f44d532ad6201.1500588272.git.baruch@tkos.co.il>
 <878tjcyy21.fsf@dell.be.48ers.dk>
Message-ID: <20170726034951.vkqyzihd27otzvbb@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, Jul 26, 2017 at 12:03:02AM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > Disable -Werror to avoid the fatal result of new gcc 7 format string warnings.
>  > Fixes:
>  > http://autobuild.buildroot.net/results/29c/29c72bc38042305310576be945c721b2fad95894/
>  > http://autobuild.buildroot.net/results/a7d/a7d38d72834b94291eaff159da277b11e2f9d63a/
>  > http://autobuild.buildroot.net/results/cfe/cfed5176075f0cb9e2f56ebef10f5d6c352baf10/
> 
>  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> Committed to 2017.02.x and 2017.05.x, thanks.

It doesn't hurt I guess, but gcc 7 was only introduced after 2017.05.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
