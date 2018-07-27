From: Geoff Levand <geoff@infradead.org>
Date: Fri, 27 Jul 2018 10:09:19 -0700
Subject: [Buildroot] [PATCH v1 1/2] dtc: bump version to 1.4.7
In-Reply-To: <20180727110728.300c06e2@windsurf>
References: <28d7fee033a5e5ef512c02d5291d20b1d19fdbbf.1532460521.git.geoff@infradead.org>
 <20180727110728.300c06e2@windsurf>
Message-ID: <10d6e217-c05f-ff72-d3fa-0459148746c3@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

Any ideas about what's wrong?

Some builds show this error:

  LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)

Which seems to be triggered from this:

  https://github.com/python/cpython/blob/e42b705188271da108de42b55d9344642170aa2b/Include/pyport.h#L701

I'll continue to look into it.

-Geoff

On 07/27/2018 02:07 AM, Thomas Petazzoni wrote:
> On Tue, 24 Jul 2018 19:32:17 +0000, Geoff Levand wrote:
>> Bump from 1.4.4 to 1.4.7.
>>
>> Signed-off-by: Geoff Levand <geoff@infradead.org>
>> ---
>>  package/dtc/dtc.hash | 2 +-
>>  package/dtc/dtc.mk   | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> This is failing all over the place in the autobuilders:
> 
>   http://autobuild.buildroot.net/?reason=%dtc-1.4.7
> 
> Could you look into those issues and provide a patch to address them ?
