From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Tue, 3 Nov 2020 11:30:48 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-11-02
Message-ID: <20201103113048.6f9d574b@x230_1.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 03 Nov 2020 08:10:08 -0000
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> Autobuilder failures
> ====================
> 
> Below is a list of build failures reported by the Buildroot
> autobuilders in relation to packages or CPU
> architectures you are in charge of. Please help us
> improving the quality of Buildroot by investigating
> those build failures and sending patches to fix
> them.Thanks!
> 
> Results for the '2020.02.x' branch
> ----------------------------------
> 
> Build failures related to your packages:
> 
>     arch     |             reason             |
>         url
> -------------+--------------------------------+---------------------------------------------------------------------------------
> powerpc64le  | gr-osmosdr-46698a67e7e06419... |
> http://autobuild.buildroot.net/results/06d216af8bf6c534bba57cca50befce399132470
> 
this was fixed by this commit:
https://patchwork.ozlabs.org/project/buildroot/patch/20200827154903.1107968-1-gwenj at trabucayre.com/

Best regards
Gwen
