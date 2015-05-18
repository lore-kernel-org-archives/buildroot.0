From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 May 2015 09:17:21 +0200
Subject: [Buildroot] [git commit] package/enlightenment: disable ptrace
	with xtensa and uClibc-ng
In-Reply-To: <CAJ3iQcomP9xHGszw38yFx2i6+3dKud-iaN1o197N9i+wQCQK8g@mail.gmail.com>
 (Gergely Imreh's message of "Mon, 18 May 2015 09:45:42 +0800")
References: <20150517190414.D6F9B817E5@busybox.osuosl.org>
 <CAJ3iQcomP9xHGszw38yFx2i6+3dKud-iaN1o197N9i+wQCQK8g@mail.gmail.com>
Message-ID: <877fs673su.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gergely" == Gergely Imreh <imrehg@gmail.com> writes:

Hi,

>> For now, disable ptrace with xtensa uClibc-ng toolchains.
 >> 
 >> Thanks to Gergely Imreh for the initial investigation and
 >> patch:
 >> http://patchwork.ozlabs.org/patch/470073/
 >> 

 > Awesome, thanks! As a procedural question (since this is the first
 > time for me like this), should I mark that linked patch in patchworks
 > as Superseeded and archived? I'm sure someone's doing housecleaning
 > there every now and than, but the less time they have to spend
 > reviewing things the better.

Yes, that's normally the way to go. I've gone ahead and marked the patch
as superseeded.

Thank you both.

-- 
Venlig hilsen,
Peter Korsgaard 
