From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 5 Oct 2014 20:59:25 +0200
Subject: [Buildroot] [git commit] protobuf: bump version to 2.6.0
In-Reply-To: <CANQCQpZJwWK1t5fKfMO3aT14PNvDYc-XejwiFXaOWpp7xE3zyg@mail.gmail.com>
References: <20141002205533.3EADC9D7E9@busybox.osuosl.org>
 <CANQCQpZJwWK1t5fKfMO3aT14PNvDYc-XejwiFXaOWpp7xE3zyg@mail.gmail.com>
Message-ID: <CAHXCMM+5snKS7vB_2OZ25fZF-05HYdc4D6hojy=Z+Z-_9Q5UNA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew, Peter, all,

On Thu, Oct 2, 2014 at 11:42 PM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Peter,
>
> On Thu, Oct 2, 2014 at 3:54 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>> commit: http://git.buildroot.net/buildroot/commit/?id=7b6304af9d69d44ee3040c00b0670f19c02de7d2
>> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>>
>> * Adds powerpc architecture support
>> * Changes to the new github upstream site
>> * Updates the license filename
>>
> <snip>
>>
>> -PROTOBUF_VERSION = 2.5.0
>> -PROTOBUF_SITE = http://protobuf.googlecode.com/files
>> +PROTOBUF_VERSION = 2.6.0
>> +PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)/
>
> (Just a general comment) I noticed that the github helper didn't work
> for this site.  I didn't dig to far into it, but I'm guessing github
> now has a couple ways they're hosting release archives?
>

In this case, the github helper does not work because, as is, it only
intends to be used when there is no explicit tarball available for a
given version (i.e. a version on a sha1 or a tag for which there is no
official download location).

In this case, there is a release section with download links (that
should not be moved so often by github poeple).

Maybe this particular point could be more explicit in the manual...

Regards,


-- 
Samuel
