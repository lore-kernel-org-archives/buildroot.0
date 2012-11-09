From: Antony Vennard <antony.vennard@macrium.com>
Date: Fri, 09 Nov 2012 13:09:05 +0000
Subject: [Buildroot] Udev on a live CD system does not appear to
 populate /dev
In-Reply-To: <509CFEAE.6090906@mind.be>
References: <5099186E.1030409@macrium.com> <509958D9.7050108@petroprogram.com>
 <5099A14C.5000204@mind.be> <509AA0C4.4060506@petroprogram.com>
 <CACpMmu9g8xXNsyQp6DheEqP9z_Q=7DwkorWc120-gW5wQj9+YA@mail.gmail.com>
 <509BA71B.6020009@petroprogram.com> <509BD78A.8050908@macrium.com>
 <509C2166.8050705@mind.be> <509CF4F8.6080608@macrium.com>
 <509CFEAE.6090906@mind.be>
Message-ID: <509D0071.3010004@macrium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm not entirely sure - I believe grub legacy can do efi; Fedora 17
certainly uses uses a variant of grub 0.97 for its EFI bootloader by
default, although they're moving to grub2 apparently.

Don't worry, I'll find the patches in git when ready - I can see them in
the git log.

Thanks,

Antony

On 09/11/2012 13:01, Arnout Vandecappelle wrote:
> On 11/09/12 13:20, Antony Vennard wrote:
>> I may also potentially be looking to integrate EFI boot into our live CD
>> at some stage - if this is of interest I can have a go at adding this to
>> buildroot also.
> 
>  I guess that will mean you'll need grub2.  A posted grub2 patches a while
> ago, if you could get them a spin and give feedback, that would be
> nice.  Or
> I can repost them if you like.
> 
>  Regards,
>  Arnout


-- 
________________

Macrium? Software is a trading name of Paramount Software UK Ltd, 
Registered in England and Wales Number 02973414
Registered Office: Kilburn House, Manchester Science Park, Lloyd St. North, 
Manchester M15 6SE United Kingdom

The information contained in this e-mail is confidential, privileged, or 
otherwise protected from disclosure. It is intended only for the use of the 
authorized individual as indicated in the e-mail. Any unauthorized 
disclosure, copying, distribution or taking of any action based on the 
contents of this material is strictly prohibited.

If you have received this e-mail in error, please delete it immediately.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 895 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121109/e9be69a7/attachment.asc>
