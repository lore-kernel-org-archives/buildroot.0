From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 31 Mar 2015 22:35:01 +0200
Subject: [Buildroot] [git commit] packages: indentation cleanup
In-Reply-To: <CABbD_XC1Dqku9OV7tRnqOVO0OoNo34pAUs+4So7WPJXJOpLEdA@mail.gmail.com>
References: <20150331115925.66C387FA85@busybox.osuosl.org>
 <CABbD_XC1Dqku9OV7tRnqOVO0OoNo34pAUs+4So7WPJXJOpLEdA@mail.gmail.com>
Message-ID: <551B04F5.1090104@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi K?roly,

> Hello Thomas, Jerzy, all,
>
> since this commit ccache ceased to work.
> The indentation cleanup in ccache.mk <http://ccache.mk> seems to add 
> some weird make error:
>
> scythe at buildroot-vm:~/buildroot$ make clean
> package/ccache/ccache.mk:70 <http://ccache.mk:70>: *** missing 
> separator.  Stop.
>
> If I add back the tabs before the lines, it works again. If I add a '; 
> \' on the end of the first 4 lines, the only line 74 produces the error.
> I think tab acts as a separator in makefiles.
> I recommend reversing the patch on just this on file.

Yes, you are right. I've sent a patch already - ccache: fix the indentation.

Regards,
Jerzy

>
> On Tue, Mar 31, 2015 at 1:57 PM, Thomas Petazzoni 
> <thomas.petazzoni@free-electrons.com 
> <mailto:thomas.petazzoni@free-electrons.com>> wrote:
>
>     commit:
>     http://git.buildroot.net/buildroot/commit/?id=bd8c733fb4a0ca6ca1aa72f8b549d53dcd37f4ee
>     branch:
>     http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
>     This commit doesn't touch infra packages.
>
>     Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net
>     <mailto:jerzy.grzegorek@trzebnica.net>>
>     Signed-off-by: Thomas Petazzoni
>     <thomas.petazzoni@free-electrons.com
>     <mailto:thomas.petazzoni@free-electrons.com>>
>
>
> snip
>
>      package/ccache/ccache.mk <http://ccache.mk>                   | 
>      10 +-
>
>
> Regards,
> Karoly
