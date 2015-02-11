From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 11 Feb 2015 10:01:11 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-02-10
In-Reply-To: <20150211073015.D49F7101159@stock.ovh.net>
References: <20150211073015.D49F7101159@stock.ovh.net>
Message-ID: <20150211080111.GQ16955@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Richard,

On Wed, Feb 11, 2015 at 08:30:15AM +0100, Thomas Petazzoni wrote:
>         i686 |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/e3c42b2a8334d910f44f7a908371796a332f20e2/
>          arm |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/04940f2f0110bc3bb19cd96cc75a6d2d7e8affd5/
>         i686 |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/e733fac165c7b90b529855b0e1ccf92ad4ac9eca/

Looks like a broken cached tar file with missing files, as it only happens on 
your build server. Can you remove this file?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
