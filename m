From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 26 May 2015 12:54:12 +0300
Subject: [Buildroot] [PATCH v2 11/13] board/boundarydevices: rework and
 update u-boot scripts
In-Reply-To: <1432628382-16799-12-git-send-email-gary.bisson@boundarydevices.com>
References: <1432628382-16799-1-git-send-email-gary.bisson@boundarydevices.com>
 <1432628382-16799-12-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20150526095412.GP2260@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Garry,

On Tue, May 26, 2015 at 10:19:40AM +0200, Gary Bisson wrote:
> The rework consists of replacing the binaries by their text file
> equivalent and generate the binaries from the post-build.sh script.

[...]

>  board/boundarydevices/nitrogen6x/6x_bootscript     | Bin 3207 -> 0 bytes
>  board/boundarydevices/nitrogen6x/6x_bootscript.txt | 186 +++++++++++++++++++++
>  .../nitrogen6x/{6x_upgrade => 6x_upgrade.txt}      | Bin 1465 -> 1393 bytes

So why do you still add the binary files, then?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
