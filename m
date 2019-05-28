From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 May 2019 22:39:27 +0200
Subject: [Buildroot] [PATCH 1/2] package/mender: bump version to 2.0
In-Reply-To: <CADHdJwDRQe+LkHcTGdgYSJEDxVjBu0Qnj3gY7Zm2mouCCqVs9A@mail.gmail.com>
References: <20190528115919.26194-1-deinok@deinok.com>
 <CADHdJwDRQe+LkHcTGdgYSJEDxVjBu0Qnj3gY7Zm2mouCCqVs9A@mail.gmail.com>
Message-ID: <2432947d-67c5-60d5-3174-156522058c7a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/05/2019 20:47, Mirza Krak wrote:
> On Tue, May 28, 2019 at 1:59 PM <deinok@deinok.com> wrote:
>>
>> From: deinok <deinok@deinok.com>
>>
>> Signed-off-by: deinok <deinok@deinok.com>
>> ---
>>  package/mender/Config.in   | 1 +
>>  package/mender/mender.hash | 2 +-
>>  package/mender/mender.mk   | 3 ++-
>>  3 files changed, 4 insertions(+), 2 deletions(-)
> 
> 
> There is already a patch pending for the 2.0.0 bump, [1].
> 
> [1]. https://patchwork.ozlabs.org/patch/1097130/

 That one, however, is marked as Changes Requested because it failed to explain
why the license file hashes have changed.

 Since this patch doesn't even update the license file hashes, I've alse marked
it as changes requested. Hint: test the version bump with 'make legal-info'.

 Regards,
 Arnout
