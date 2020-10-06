From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 6 Oct 2020 13:57:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/qpid-proton: bump to version
 0.32.0
In-Reply-To: <60c2ecab-ad01-7770-d432-640a0d639626@lucaceresoli.net>
References: <20201004200050.1737235-1-fontaine.fabrice@gmail.com>
 <60c2ecab-ad01-7770-d432-640a0d639626@lucaceresoli.net>
Message-ID: <CAPi7W82bZs54aj3+7_a76SZ8wbXtoB7=jxqq7gqA68Cij1WZtw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Luca,

Le mar. 6 oct. 2020 ? 10:36, Luca Ceresoli <luca@lucaceresoli.net> a ?crit :
>
> Hi Fabrice,
>
> On 04/10/20 22:00, Fabrice Fontaine wrote:
> > - Update site to get latest version
> > - Remove all patches (already in version)
> > - License file has been renamed and slightly updated to change paths
> >   since version 0.23.0 and
> >   https://github.com/apache/qpid-proton/commit/37136940e3077f25ce58c94775f48c66f666f4a8
> > - Add a patch to disable tests
> > - Remove BUILD_{JAVA,JAVASCRIPT,PERL,PHP} as those bindings don't exist
> >   anymore
> > - Disable go binding
> > - Disable fuzz testing
> > - Add new optional libuv and jsoncpp dependencies
> > - Update QPID_PROTON_REMOVE_USELESS_FILES
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Thank you very much for taking care of upgrading this package. I tried a
> while back but gave up as it was taking too much time for a package I am
> not actively using.
>
> The patch content looks good, but I'm getting a build failure after a
> simple 'make clean && make' with this defconfig:
>
> BR2_arm=y
> BR2_cortex_a8=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PACKAGE_QPID_PROTON=y
>
> Can you check that?
This defconfig is building fine on my side. What kind of error do you get?
>
> --
> Luca
Best Regards,

Fabrice
