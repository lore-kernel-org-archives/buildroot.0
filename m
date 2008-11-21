From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Fri, 21 Nov 2008 12:22:37 +0100
Subject: [Buildroot] [PATCH] target/iso9660/iso9660.mk
In-Reply-To: <20081121111147.GD19111@mx.loc>
References: <e4c675870811210211s3080d990ue4b59efe2c4a3d68@mail.gmail.com>
	<20081121103242.GB19111@mx.loc>
	<e4c675870811210248j12a6082au9a17b1723d3d8cd9@mail.gmail.com>
	<20081121111147.GD19111@mx.loc>
Message-ID: <e4c675870811210322n569f7c30ia90e8c463bba080a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/11/21 Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>:
> On Fri, Nov 21, 2008 at 11:48:25AM +0100, Roberto A. Foglietta wrote:
>>2008/11/21 Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>:
>>> On Fri, Nov 21, 2008 at 11:11:59AM +0100, Roberto A. Foglietta wrote:

[cut]

>> touching the initrd means: if you forget to modify menu.lst you will
>>not pay the fee to see your system unable to boot.
>>
>> The question: is there any condition in which touching initrd really
>>hurts somebody? I think the answer is no.
>
> Yes, it hurts since it's an unwarranted inode and adds to the size of
> the image needlessly. It is simply not clean and not the proper thing
> to do.
>>
>> Under this point of view touching initrd save time to skilled users
>>and make things work for those are not such skilled users
>
> I did it a bit differently, fyi.
>

 I happy to know there is a better way to do that.
 Could you post here to for the sake of completeness, please?

 Ciao,
--
/roberto
