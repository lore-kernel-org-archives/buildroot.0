From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Tue, 14 Feb 2012 18:15:33 +0200
Subject: [Buildroot] [PATCH] build: add 'file' option for 'make
	defconfig'
In-Reply-To: <201202141453.23995.arnout@mind.be>
References: <1328918596-19369-1-git-send-email-felipe.contreras@gmail.com>
 <CAAXf6LVPo6hWwJFUm3dzFYPAVvC=_=aBP1B7XSQ26spoyuEYFA@mail.gmail.com>
 <CAMP44s2yuoJ38UdeaRbgeLo9QvPDgrv1roPzgjKL-QZdt7W54g@mail.gmail.com>
 <201202141453.23995.arnout@mind.be>
Message-ID: <CAMP44s1GvXK-9h_Rs2QNL6g4jBQfHnZ2gdYdRn+oTYxgDC4g3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 14, 2012 at 3:53 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Tuesday 14 February 2012 13:44:03 Felipe Contreras wrote:
>
>> > If one creates a defconfig file, why not store it in 'configs' ?
>
>>
>
>> Because it's personal.
>
>>
>
>> I want to be able to clone buildroot, and 'make defconfig
>
>> file=/media/drive/notes/my-buildroot-config'.
>
>
> Same here.
>
>
> BTW, regarding the naming: eventually I'd like to include BR2_DEFCONFIG
>
> in the .config, which gets qstripped to DEFCONFIG in the Makefile. This can
>
> be used to be able to store the config again, similar to
> linux-update-defconfig.

That would be nice. I just do 'make savedefconfig' and manually merge
the changes with gvimdiff (I might not want all of them).

Cheers.

-- 
Felipe Contreras
