From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 21 Feb 2015 10:17:50 -0300
Subject: [Buildroot] [PATCH] dialog: bump to version 1.2-20150125
In-Reply-To: <20150221140752.3aa8449b@free-electrons.com>
References: <1424519547-16093-1-git-send-email-gustavo@zacarias.com.ar>
 <20150221140752.3aa8449b@free-electrons.com>
Message-ID: <54E8857E.30200@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/21/2015 10:07 AM, Thomas Petazzoni wrote:

> Dear Gustavo Zacarias,
> 
> On Sat, 21 Feb 2015 08:52:27 -0300, Gustavo Zacarias wrote:
>> And drop thread requirement, it's really not necessary.
>> For python-dialog that was already inherent in python itself.
>>
>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> 
> Applied to next, thanks. Interestingly, it's you who added this thread
> dependency because dialog needs MMU. And Peter applied the patch. See:

Yes, i find it was odd as well and backtracked on it since tests say
it's not required at all (and the TODO for dialog says "we want threads
eventually" which is a clear sign heh).
Regards.
