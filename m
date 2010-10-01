From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Fri, 1 Oct 2010 10:14:19 +0200
Subject: [Buildroot] libpng install question
In-Reply-To: <0D753D10438DA54287A00B0270842697644545753B@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B0270842697644545753B@AUSP01VMBX24.collaborationhost.net>
Message-ID: <AANLkTi=2p=Zesb=ruU5MVfQdJGy7nSG=OL1FPXMFEtd3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

libpng12-config and libpng-config are part of the libpng package, so
it is normal they are being installed on the target. However they
shouldn't be installed unless you've selected to installed development
files in the buildroot config.
This might be a small regression introduced by this commit :
http://git.buildroot.org/buildroot/commit/?id=55ade5c7964e15f9b1eba061ab840cc4c25e4e37
Are you using a recent version of the buildroot's git repository ?

--
Lionel Landwerlin

On Fri, Oct 1, 2010 at 2:51 AM, H Hartley Sweeten
<hartleys@visionengravers.com> wrote:
> Hello all,
>
> I was wondering why libpng12-config and libpng-config are installed to the target.
> I thought these were host tools?
>
> Regards,
> Hartley
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
