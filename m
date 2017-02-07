From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 7 Feb 2017 21:51:14 +0000 (UTC)
Subject: [Buildroot] [PATCH 1/1] Add notes explaining that SITE_METHOD
 == local prevents any patches from being applied to the package sources.
References: <20170207204053.18749-1-grant.b.edwards@gmail.com>
 <CAAXf6LU_5HZ1aDfCi+T1SZcx3bk7276uReqP4HHvmSMiC-5+xg@mail.gmail.com>
Message-ID: <o7dfgi$2tn$2@blaine.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-02-07, Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
> Hi Grant,
>
> On Tue, Feb 7, 2017 at 9:40 PM, Grant Edwards <grant.b.edwards@gmail.com> wrote:
>> Signed-off-by: Grant Edwards <grant.b.edwards@gmail.com>
>> ---
>>  docs/manual/adding-packages-generic.txt | 17 +++++++++--------
>>  docs/manual/customize-patches.txt       |  3 ++-
>>  docs/manual/patch-policy.txt            |  4 ++++
>>  3 files changed, 15 insertions(+), 9 deletions(-)

> When a package source is overridden using the FOO_OVERRIDE_SRCDIR
> mechanism, the same is true: no patches are applied automatically, the
> overridden srcdir is supposed to be complete and used as-is. Perhaps
> the documentation updates could also cover that?

Sure, I'll add that.

-- 
Grant Edwards               grant.b.edwards        Yow! I'm having an
                                  at               EMOTIONAL OUTBURST!!  But,
                              gmail.com            uh, WHY is there a WAFFLE
                                                   in my PAJAMA POCKET??
