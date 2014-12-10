From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 10 Dec 2014 10:22:19 +0000
Subject: [Buildroot] [PATCH 0/3] slang: fix static builds
In-Reply-To: <20141209203440.53026bbb@free-electrons.com>
References: <1418125881-7915-1-git-send-email-Vincent.Riera@imgtec.com>
 <20141209203440.53026bbb@free-electrons.com>
Message-ID: <54881EDB.208@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 12/09/2014 07:34 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Tue, 9 Dec 2014 11:51:18 +0000, Vicente Olivert Riera wrote:
>> - Rename current patches to follow the new name convention.
>> - Adapt upstream patches to allow building only the static library and a
>>   static version of slsh.
>> - Use specific build and install commands when doing static builds.
>>
>> Vicente Olivert Riera (3):
>>   slang: rename patches to follow the new name convention
>>   slang: add adapted upstream patches for static builds
>>   slang: use specific build and install commands for static builds
> 
> All three patches applied, thanks. The last two patches could have been
> only one since they are both needed to fix the static linking problem.

Well..., yeah, but it's easier to review, and the series is still
bisectable :P

Cheers,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
