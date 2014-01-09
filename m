From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 9 Jan 2014 12:09:30 +0000
Subject: [Buildroot] [PATCH 1/2] sdl: rename patches to add sequence
	numbers
In-Reply-To: <20140109120801.GS4659@sapphire.tkos.co.il>
References: <1389268653-45909-1-git-send-email-Vincent.Riera@imgtec.com>
 <20140109120801.GS4659@sapphire.tkos.co.il>
Message-ID: <52CE917A.20604@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/09/2014 12:08 PM, Baruch Siach wrote:
> Hi Vicente,
>
> On Thu, Jan 09, 2014 at 11:57:32AM +0000, Vicente Olivert Riera wrote:
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>>   .../sdl/sdl-0001-use-correct-directfb-config.patch |   40 ++++++++++++++++++++
>>   package/sdl/sdl-use-correct-directfb-config.patch  |   40 --------------------
>>   2 files changed, 40 insertions(+), 40 deletions(-)
>>   create mode 100644 package/sdl/sdl-0001-use-correct-directfb-config.patch
>>   delete mode 100644 package/sdl/sdl-use-correct-directfb-config.patch
>
> When generating rename patches like this one please add -M to your 'git
> format-patch' or 'git send-email' commands. This makes reviewing easier.
>
> baruch
>

Oh, ok. I didn't know that, sorry.

-- 
Vincent
