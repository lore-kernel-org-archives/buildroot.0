From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 10 Jan 2014 10:07:20 +0000
Subject: [Buildroot] [PATCH] libnfc-llcp: rename to libllcp and bump
	version
In-Reply-To: <20140110072347.40221f62@skate>
References: <1389287265-1498-1-git-send-email-Vincent.Riera@imgtec.com>
 <20140110072347.40221f62@skate>
Message-ID: <52CFC658.8010202@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/09/2014 11:23 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
>
> On Thu, 9 Jan 2014 17:07:45 +0000, Vicente Olivert Riera wrote:
>
>> -config BR2_PACKAGE_LIBNFC_LLCP
>> -	bool "libnfc-llcp"
>> +config BR2_PACKAGE_LIBLLCP
>> +	bool "libllcp"
>
> You're renaming an option which I believe was part of a Buildroot
> release, so please add the necessary Config.in.legacy stuff to ensure
> that users upgrading are notified of this change.
>
> Thanks!
>
> Thomas
>

v3 sent. Thanks for your comments.

-- 
Vincent
