From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 21 Oct 2019 20:59:46 +0200
Subject: [Buildroot] [PATCH 1/2] package/libnspr: bump to version 4.23
In-Reply-To: <20191021191638.31c91f18@windsurf>
References: <20191021143045.92888-1-giulio.benetti@benettiengineering.com>
 <20191021191638.31c91f18@windsurf>
Message-ID: <bfc84f10-f342-25a0-9559-9913f2b13b96@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/21/19 7:16 PM, Thomas Petazzoni wrote:
> On Mon, 21 Oct 2019 16:30:44 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/libnspr/libnspr.hash | 2 +-
>>   package/libnspr/libnspr.mk   | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> Both applied, thanks. Does the bump of libnss for security reasons
> requires the bump of libnspr ? 

Yes, libnss 3.47 requires libnspr >= 4.23 as stated here:
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.47_release_notes#Distribution_Information

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> This is quite important for the LTS branch.
