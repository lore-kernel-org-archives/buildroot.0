From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 8 Nov 2019 15:08:30 +0100
Subject: [Buildroot] sysrepo
In-Reply-To: <CAPi7W81eAVaY57jh40GQvzSRr-z4vysA9gK5948ddsKxgHxnFA@mail.gmail.com>
References: <AM0PR04MB6403DB36B76351BD39E6038F847B0@AM0PR04MB6403.eurprd04.prod.outlook.com>
 <CAPi7W81eAVaY57jh40GQvzSRr-z4vysA9gK5948ddsKxgHxnFA@mail.gmail.com>
Message-ID: <CAEyMn7bbWeTM4z-Czpr=x0Z2sYuOFxfLJ4A52v+5FnbYBiNiEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

yes I'm aware of that issue. And I already submitted a patch to fix
this and other stuff
(http://lists.busybox.net/pipermail/buildroot/2019-November/265212.html).

There are also the netopeer2(server/cli/keystored) packages
outstanding (http://lists.busybox.net/pipermail/buildroot/2019-October/264461.html).

But thank you for reporting that. It is good to hear that others also
working/waiting for that packages.

By the way. Could you please use git send-email for sending your patch
to the mailing list? this is more easy for reviewing and applying the
patch for the maintainers. You will find a introduction how to do
here:
https://buildroot.org/downloads/manual/manual.html#_contributing_to_buildroot
and for sending the patches here:
https://buildroot.org/downloads/manual/manual.html#submitting-patches

Thanks,
Heiko

Am Fr., 8. Nov. 2019 um 14:25 Uhr schrieb Fabrice Fontaine
<fontaine.fabrice@gmail.com>:
>
> Hi Xiaolin,
>
> I'm not the one that added sysrepo to buildroot, this was the work of Heiko.
> As I only helped to fix some of the bugs on this package, I think
> Heiko will probably give a better review than me.
>
> Best Regards,
>
> Fabrice
>
>
> Le ven. 8 nov. 2019 ? 13:20, Xiaolin He <xiaolin.he@nxp.com> a ?crit :
> >
> > Hi Fabrice,
> >
> >        Thanks a lot for adding sysrepo to buildroot.
> >
> > Basing on your work, I added Netopeer2 pacakge. But when I Install yang modules with host-sysrepoctl, it will install related modules to host directory.
> >
> > Like following:
> >
> >        - Installing module ietf-x509-cert-to-name...
> >
> > Installing a new module from file '/home/hexl/bitbucket/openil/output/build/netopeer2-keystored-v0.7-r2/keystored/scripts/../../modules/ietf-x509-cert-to-name.yang'...
> >
> > Installing the YANG file to '/home/hexl/bitbucket/openil/output/host/etc/sysrepo/yang/ietf-x509-cert-to-name at 2014-12-10.yang'...
> >
> > Thus, when I run my netopeer2-server on board, it will be failed.
> >
> > Finally, I change the config option of host-sysrepo as the attachment do, and the issue was fixed.
> >
> > But I don?t sure whether this patch is rational or not or have other effects on your apps. So, please review it.
> >
> > Best Regards,
> >
> > Xiaolin He
