From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 2 Dec 2013 15:03:29 +0000
Subject: [Buildroot] [PATCH v2] qt5script: Disable on MIPS64 n64 ABI
In-Reply-To: <20131202132629.4f65c28a@skate>
References: <1385984739-731-1-git-send-email-Vincent.Riera@imgtec.com>
 <20131202132629.4f65c28a@skate>
Message-ID: <529CA141.9050801@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/02/2013 12:26 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
>
> On Mon, 2 Dec 2013 11:45:39 +0000, Vicente Olivert Riera wrote:
>> There is no support for JavaScritCore on MIPS64 n64 ABI so as a quick
>> fix we can disable the posibility of selecting this package. Meanwhile a
>> proposed patch has already been sent to Qt:
>>
>>     https://bugreports.qt-project.org/browse/QTBUG-35191
>>
>> Fixes:
>>
>>     http://autobuild.buildroot.net/results/231/231c112a3fc18e6cd7d6d10873e22144525c7280/
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>>   package/qt5/qt5script/Config.in |    1 +
>>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> Now that 2013.11 has been released, we don't need "quick fixes"
> anymore. What about integrating the upstream Qt5 fix instead?
>
> Thanks!
>
> Thomas
>

Ok, the problem with qt5script on MIPS64 n64 is already fixed on Qt 5.2, 
and the Release Candidate 1 is already available so we will have Qt 5.2 
final release in few weeks. This problem will be fixed with the next 
version bump.

-- 
Vincent
