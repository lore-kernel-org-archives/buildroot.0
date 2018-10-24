From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Oct 2018 14:16:15 +0100
Subject: [Buildroot] [RFC PATCH 1/1] libffi: v3.2.1 doesn't support
 riscv targets yet
In-Reply-To: <20181024103637.487f6190@windsurf>
References: <20181023214409.6818-1-ferdinand@ombud.nl>
 <81a2a99d-9d72-7821-e7c1-9a09d76d77e5@mind.be>
 <20181024103637.487f6190@windsurf>
Message-ID: <001f96ac-a143-7039-00cd-0e46f0aecd0f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/24/18 9:36 AM, Thomas Petazzoni wrote:
> Hello,
> 
> +Mark Corbin in Cc.
> 
> On Wed, 24 Oct 2018 01:24:09 +0100, Arnout Vandecappelle wrote:
>>  Personally, I would be fine with doing this gradually, i.e. it is not needed to
>> fix all 150 packages in a single commit. Indeed, the build is already broken
>> anyway, so if this is shown as a circular dependency warning or as a build
>> failure of libffi doesn't matter that much.
> 
> ... I am indeed not opposed to fixing properly the libffi arch
> dependencies. It is true that with the autobuilders in place, we can do
> this gradually. It would be cleaner than the magic exception we have in
> the autobuilder script. The downside is that we will have for a fairly
> long time a significant number of autobuilder failures.

 We can leave the autobuilder exceptions in place until we think that most of
the dependencies have been fixed.

 Regards,
 Arnout
