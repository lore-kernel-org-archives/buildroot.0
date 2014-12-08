From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 8 Dec 2014 10:05:36 +0000
Subject: [Buildroot] [PATCH branch/next] pinentry: bump version to 0.9.0
In-Reply-To: <20141208102220.7a8242d2@free-electrons.com>
References: <1417190979-53042-1-git-send-email-Vincent.Riera@imgtec.com>
 <20141208102220.7a8242d2@free-electrons.com>
Message-ID: <548577F0.5020700@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/08/2014 09:22 AM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Fri, 28 Nov 2014 16:09:39 +0000, Vicente Olivert Riera wrote:
>> - Bump version to 0.9.0
>> - Add a hash file
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>>  package/pinentry/pinentry.hash |    2 ++
>>  package/pinentry/pinentry.mk   |    2 +-
>>  2 files changed, 3 insertions(+), 1 deletions(-)
>>  create mode 100644 package/pinentry/pinentry.hash
> 
> Apparently causes some build failures:
> http://autobuild.buildroot.org/results/314/314de324a09f64f8b95882ca169c77847d75680c/build-end.log.
> 
> Can you have a look?
> 
> Thanks!
> 
> Thomas
> 

Sure, I will have a look at it now :-)

Cheers,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
