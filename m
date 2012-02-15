From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Wed, 15 Feb 2012 13:53:04 +0200
Subject: [Buildroot] [PATCH] build: add 'file' option for 'make
	defconfig'
In-Reply-To: <CAAXf6LWX1GYtHYCQzaaohgDg2NM=cZMoDErcNBv-w4NNC-hrtA@mail.gmail.com>
References: <1328918596-19369-1-git-send-email-felipe.contreras@gmail.com>
 <CAAXf6LVPo6hWwJFUm3dzFYPAVvC=_=aBP1B7XSQ26spoyuEYFA@mail.gmail.com>
 <CAMP44s2yuoJ38UdeaRbgeLo9QvPDgrv1roPzgjKL-QZdt7W54g@mail.gmail.com>
 <201202141453.23995.arnout@mind.be>
 <CAAXf6LWX1GYtHYCQzaaohgDg2NM=cZMoDErcNBv-w4NNC-hrtA@mail.gmail.com>
Message-ID: <CAMP44s1U7KBFk7zpoU1Kp_1NfsmfQ2VY3qqyxPaPSn=yTp2w1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 15, 2012 at 8:58 AM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> Ok, I see. I have been used to having my own repository for buildroot
> and didn't think of people who just download a tarball each time.

Some might, I don't, but I don't want to be carrying patches for the
configs on all my branches either =/

>> BTW, regarding the naming: eventually I'd like to include BR2_DEFCONFIG
>>
>> in the .config, which gets qstripped to DEFCONFIG in the Makefile. This can
>>
>> be used to be able to store the config again, similar to
>> linux-update-defconfig.
>
> I once proposed a patch that did something similar:
> http://lists.busybox.net/pipermail/buildroot/2011-February/041626.html
>
> It would automatically save the last used 'defconfig' instead of
> requiring an explicit 'file' option.

Yeah but the defconfig would have to be on the configs dir.

Also, this saves the .config, not the simplified defconfig.

Cheers.

-- 
Felipe Contreras
