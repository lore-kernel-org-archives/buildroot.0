From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 22 Mar 2018 07:49:13 +0200
Subject: [Buildroot] [PATCH v1 1/2] gnutls: needs C++ support
In-Reply-To: <20180321202312.23021-1-ps.report@gmx.net>
References: <20180321202312.23021-1-ps.report@gmx.net>
Message-ID: <20180322054912.akgs3lgdfgiiee6s@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, Mar 21, 2018 at 09:23:11PM +0100, Peter Seiderer wrote:
> Fixes Bug 10846 ([1]):
> 
>   checking how to run the C++ preprocessor... cpp
>   configure: error: in `.../build/gnutls-3.5.17':
>   configure: error: C++ preprocessor "cpp" fails sanity check
>   See `config.log' for more details
> 
> [1] https://bugs.busybox.net/show_bug.cgi?id=10846
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

This is strange. Do you have idea why the autobuilders didn't catch that?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
