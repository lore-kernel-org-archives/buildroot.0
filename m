From: Stuart Longland <stuartl@longlandclan.id.au>
Date: Sun, 28 Jan 2018 17:39:57 +1000
Subject: [Buildroot] Compiling gcc for the target?
In-Reply-To: <CAMo8Bf+fBXzYTj2DZ_LreJswp8R82GDEn7vNZ=Gt-Nq7XLpTDg@mail.gmail.com>
References: <45535c2a-31b5-8063-d749-926f7c2f023f@longlandclan.id.au>
 <20180128033001.gf7u5ix6twj7dghu@tarshish>
 <08307c18-be19-dbe5-cefe-428d01f5db80@longlandclan.id.au>
 <CAMo8Bf+=vAWQmx4ciVPD7ZeaN6H4eht1CJr7hWBgKDf1UnMgNg@mail.gmail.com>
 <04e2a7a3-6344-6e78-1aa4-d6fcc9cf02c6@longlandclan.id.au>
 <CAMo8Bf+fBXzYTj2DZ_LreJswp8R82GDEn7vNZ=Gt-Nq7XLpTDg@mail.gmail.com>
Message-ID: <2f01d768-7e4b-1b0d-4cda-420b3d09aa64@longlandclan.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Max,
On 28/01/18 15:38, Max Filippov wrote:
>> I'm not sure if maybe there's an experimental branch that supports musl
>> or if I missed an option somewhere, but I couldn't get it to oblige.
> In current ct-ng LIBC_MUSL has the following dependencies:
> 
> Depends on: GEN_CHOICE_LIBC [=y] && !WINDOWS [=n] && !BARE_METAL [=n]
> && EXPERIMENTAL [=y]

EXPERIMENTAL=y was one option I missed, but evidently it's not the only
one as I get:
> [00:01] / Invalid configuration `': machine `' not recognized

That said, it looks like the right avenue to pursue so I think I'll
chase up the mailing list for crosstool-ng and proceed from there.
-- 
Stuart Longland (aka Redhatter, VK4MSL)

I haven't lost my mind...
  ...it's backed up on a tape somewhere.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180128/603c4c09/attachment.asc>
