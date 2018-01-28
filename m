From: Stuart Longland <stuartl@longlandclan.id.au>
Date: Sun, 28 Jan 2018 15:25:47 +1000
Subject: [Buildroot] Compiling gcc for the target?
In-Reply-To: <CAMo8Bf+=vAWQmx4ciVPD7ZeaN6H4eht1CJr7hWBgKDf1UnMgNg@mail.gmail.com>
References: <45535c2a-31b5-8063-d749-926f7c2f023f@longlandclan.id.au>
 <20180128033001.gf7u5ix6twj7dghu@tarshish>
 <08307c18-be19-dbe5-cefe-428d01f5db80@longlandclan.id.au>
 <CAMo8Bf+=vAWQmx4ciVPD7ZeaN6H4eht1CJr7hWBgKDf1UnMgNg@mail.gmail.com>
Message-ID: <04e2a7a3-6344-6e78-1aa4-d6fcc9cf02c6@longlandclan.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Max,
On 28/01/18 15:16, Max Filippov wrote:
>> Thats, unfortunate.  I can understand its an atypical use case for
>> buildroot and sadly, building gcc seems to be far more difficult than it
>> ought to be.
> You could build both cross- and cross-native toolchains with crosstool-NG
> and then use cross-toolchain as an external toolchain for the buildroot. I did
> that for xtensa target architecture.

I did try crosstool-ng? it only gave me uClibc or glibc options, not musl.

I'm not sure if maybe there's an experimental branch that supports musl
or if I missed an option somewhere, but I couldn't get it to oblige.
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180128/743c900d/attachment.asc>
