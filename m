From: Ryan Coe <bluemrp9@gmail.com>
Date: Mon, 16 Sep 2019 06:16:19 -0700
Subject: [Buildroot] [PATCH 4/5] package/mariadb: bump to version 10.3.18
In-Reply-To: <20190915220246.3308ff51@windsurf.home>
References: <20190915193559.8464-1-bluemrp9@gmail.com>
 <20190915193559.8464-4-bluemrp9@gmail.com>
 <20190915220246.3308ff51@windsurf.home>
Message-ID: <074904f2-586e-5b9a-155f-e931760b3ab0@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 9/15/2019 1:02 PM, Thomas Petazzoni wrote:
> On Sun, 15 Sep 2019 12:35:58 -0700
> Ryan Coe <bluemrp9@gmail.com> wrote:
>
>> Release notes:
>> https://mariadb.com/kb/en/library/mariadb-10318-release-notes/
>>
>> Changelog:
>> https://mariadb.com/kb/en/mariadb-10318-changelog/
>>
>> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> So, I assume you kept this separate from the 10.3.17 bump, because the
> 10.3.17 bump is a version bump that fixes security issues ?

My apologies... Yes, 10.3.17 should be labeled as a security bump and it 
was separate to allow cherry-picking into the LTS branches.


> Also, do these bumps require PATCH 1/5 ?
Yes, this patch is needed even for the current version.
> Thanks,
>
> Thomas
