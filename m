From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 18 Aug 2014 19:18:38 +0200
Subject: [Buildroot] [PATCHv2 1/2] getent: new package
In-Reply-To: <20140818173352.1e11793e@free-electrons.com>
References: <1408355649-28891-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1408355649-28891-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAAXf6LWWdZF12uQBX487i71S8JLSqDuFf3tRtLfPhK=wbJd-Mg@mail.gmail.com>
 <20140818165248.393a57db@free-electrons.com>
 <CAAXf6LUpx7wmcLzmueM-1a2NJGJwwSLxkMcfaW1Q69ai_sWdXw@mail.gmail.com>
 <20140818173352.1e11793e@free-electrons.com>
Message-ID: <fa82c541-9ded-486a-b44a-4b255f4a79c4@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> schreef:
>Dear Thomas De Schampheleire,
>
>On Mon, 18 Aug 2014 17:07:08 +0200, Thomas De Schampheleire wrote:
>
>> > Which license text file should be used? In neither of the uclibc/musl
>> > or glibc cases we have access to the license text. I can include a
>> > COPYING file in package/getent/, but that's going to be 100x times
>> > larger than the getent script :)
>> 
>> Hmm, not sure what to do here.
>> 
>> If we don't specify anything, the developer wanting to distribute an
>> image will have to manually add a LGPL2.1 license text.
>> 
>> Is there a big problem that the license text would be so much bigger
>> than the script itself? If we'd have multiple packages with source
>> included in buildroot, we could move the licenses to one directory to
>> avoid duplication.
>> 
>> But I have no strong opinion here...
>
>Note that we have a lot of packages that have a value for
><pkg>_LICENSE, and no value defined for <pkg>_LICENSE_FILES.
>
>According to http://autobuild.buildroot.org/stats/, we have 76 packages
>without <pkg>_LICENSE, and 152 without <pkg>_LICENSE_FILES. Therefore, I
>think that's a more global problem, not limited to just this package.
>At least, I don't think it should be a blocking issue, especially
>considering the fact that this set of patches is meant to fix a bug
>before the release.

No, agreed, let's proceed with this version of the patch...

Best regards,
Thomas
