From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Tue, 22 Sep 2009 18:16:48 -0400
Subject: [Buildroot] [pull request] Buildroot cleanup, v2
In-Reply-To: <1253135266-26880-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1253135266-26880-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901D422CB@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, September 16, 2009 2:08 PM, Thomas Petazzoni wrote:
> Here is a resend of my patch series to cleanup various aspects of
> Buildroot. Changes against the previous version are the following:
> 
>  * Modified the patch on using "output" as the default output
>    directory to match Peter suggestion regarding simplification of the
>    implementation
> 
>  * Added a documentation patch that updates the documentation with the
>    proposed modifications and also adds informations about various
>    other things
> 
>  * Rebased on top of the current git
> 
> A discussion on this cleanup already took place, and I think that most
> of the objections have found answers through the proposal of
> alternative solutions.
> 
> Therefore, could the huge-cleanup branch at
> git://git.busybox.net/~tpetazzoni/git/buildroot be pulled into the
> master repository ?
> 
> If not, please tell me whether other fixes are needed or if I should
> give up with the whole idea for design reasons.
> 

Thomas,

Nice work with the cleanup!

To further cleanup the build do you think it's worthwhile to create a
"Makefile.autotools.host.in" or just extend "Makefile.autotools.in" to
handle the various packages that do a make for the host?  At a quick
glance it appears they all go thru the same steps for the host build.

Regards,
Hartley
