From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Tue, 12 Mar 2013 00:01:26 +0200
Subject: [Buildroot] [PATCH] uClibc: add execvpe() function
In-Reply-To: <513E19CF.8060008@mind.be>
References: <1362849379-32035-1-git-send-email-stefan.froberg@petroprogram.com>
 <513E19CF.8060008@mind.be>
Message-ID: <513E5436.9080400@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

11.3.2013 19:52, Arnout Vandecappelle kirjoitti:
> On 03/09/13 18:16, Stefan Fr?berg wrote:
>> add execvpe() function to uClibc 0.9.33.2
>
>  Perhaps you could explain why this is needed? Is it also for udev?
>
>
>  Regards,
>  Arnout
>

Kinda.
It's a support patch for that systemd 197 patch made by Olivier Schonken.

Regards
Stefan
