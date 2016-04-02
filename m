From: Matthew Weber <matt@thewebers.ws>
Date: Fri, 1 Apr 2016 23:59:14 -0500
Subject: [Buildroot] [PATCH 1/1] syslinux: Allow to build multiple
	flavors simultaneously
In-Reply-To: <1458202156-25097-1-git-send-email-benoit.allard@greenbone.net>
References: <1458202156-25097-1-git-send-email-benoit.allard@greenbone.net>
Message-ID: <CAFt09wOfQmzxS9Y=hP+BtsVH-3C6J6Nnj05z5ujV892WCcaYeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Benoit,

On Thu, Mar 17, 2016 at 3:09 AM, Beno?t Allard
<benoit.allard@greenbone.net> wrote:
> This becomes handy when building hybrid images that needs to be able to boot
> in MBR and GPT mode.
>
> Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>

I built a qemu x86 target and verified that after selecting both iso
and mbr they were installed.  This update will come in handy on at
least one of my projects where we build two types of media sets from
the output and need iso/mbr options without creating separate builds
or a post image script that extracts the other bin file from the
build/syslinux folder.

Tested-by Matt Weber <matt@thewebers.ws>
Reviewed-by Matt Weber <matt@thewebers.ws>

-- 
Thanks,
Matt
