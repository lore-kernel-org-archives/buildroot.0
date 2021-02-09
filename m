From: manu f <e.fiancette@gmail.com>
Date: Tue, 9 Feb 2021 18:38:57 +0100
Subject: [Buildroot] BR2_HOST_GCC_AT_LEAST_4_8 not set but toolchain >
 linaro-7.3-2018.05 !?
In-Reply-To: <c65a774ad24c28353560af07596f1a8f@umbiko.net>
References: <mailman.2252.1612552067.250548.buildroot@busybox.net>
 <acc14f9c1a468562ab695cb5b68edd97@umbiko.net>
 <CAGshWo1TDiuuYmRWOF-=jbxdMkbDeuK6Ukp3fnzvx6PKtbad5A@mail.gmail.com>
 <c65a774ad24c28353560af07596f1a8f@umbiko.net>
Message-ID: <CAGshWo3jVrhCNEetBj=xmOJ_PsbEDna7biGaCjVORoSqW7xXeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry Andreas ..
Reason is the initial project was with this version.
Regards

Le mar. 9 f?vr. 2021 ? 18:05, Andreas Ziegler <br015@umbiko.net> a ?crit :

> Hi Emmanuel,
>
> ... please keep the mailing list on CC.
>
> On 2021-02-09 15:42, manu f wrote:
>
> > I think the problem come from the fact my gcc host is version 9 and
> > there are no rule in buildroot 2018.11.x version I compile for this
> > version (gcc 9 was not existing)
> > Could you confirm this ?
>
> You already found it by yourself: the 2018 version stops at gcc-8; gcc-9
> was added in Feb 2020. [1]
>
> I can think of three options:
>
> (1) Patch your current Buildroot installation (no support)
> (2) Upgrade to Buildroot 2020.02 (may break your target firmware)
> (3) Install gcc 8.x on your host machine
>
> Any specific reason for the 2018.11 version?
>
> Kind regards,
> Andreas
>
> [1] https://github.com/buildroot/buildroot/commit/1776190fb19f
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210209/fe282303/attachment.html>
