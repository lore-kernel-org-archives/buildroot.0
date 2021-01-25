From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Jan 2021 22:17:04 +0100
Subject: [Buildroot] Porting a vendor specific yocto layer to the
 buildroot
In-Reply-To: <CAGF7ZoZ8MUBbEB=6gXOCCSPNFJcF_Kva=XQducEx_u+O0EeATg@mail.gmail.com>
 (scd rjcom's message of "Mon, 25 Jan 2021 12:33:02 -0800")
References: <1611562430908-0.post@n4.nabble.com>
 <877do07r4c.fsf@dell.be.48ers.dk>
 <CAGF7ZoZ8MUBbEB=6gXOCCSPNFJcF_Kva=XQducEx_u+O0EeATg@mail.gmail.com>
Message-ID: <8735yo7m3z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "scd" == scd rjcom <scdrjcom@gmail.com> writes:

Hi,

 > Thank you!  I understand that the vendor specific layers have their own
 > packages and customizations.

 > I was looking for some generic guidelines to perform this. (Assuming that
 > all the packages are open source)

Well, besides the suggestions I provided already, I don't really know
what else I can tell. In Buildroot, the content of the rootfs comes from
packages, rootfs overlays and post-build scripts, so you need to match
the things that the yocto layer does to these 3 things.


 > It would be great if buildroot documentation will provide some guidelines
 > to perform the porting of the Yocto layers to Buildroot.

But the Buildroot developers may not be Yocto experts (I'm certainly
not), so I am not sure we are the best people to provide a 1-to-1
mapping between yocto concepts and the Buildroot equivalent.

But if you do, I don't see why we couldn't carry such a cheat sheet in
the manual.

-- 
Bye, Peter Korsgaard
