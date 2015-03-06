From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 06 Mar 2015 06:34:59 -0300
Subject: [Buildroot] [PATCH 2/2] samba4: bump to version 4.2.0
In-Reply-To: <20150306102632.20dff6f7@free-electrons.com>
References: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>	<1425588249-20942-2-git-send-email-gustavo@zacarias.com.ar>	<20150305232946.3620697e@free-electrons.com>	<54F8F0AC.8030707@zacarias.com.ar>	<20150306094008.7baf8c91@free-electrons.com>	<54F96D83.4010304@zacarias.com.ar>
 <20150306102632.20dff6f7@free-electrons.com>
Message-ID: <54F974C3.2020509@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/06/2015 06:26 AM, Thomas Petazzoni wrote:

>> Because the workload and noise committing will go up higher if that's
>> the choice.
>> And how does a package style fix differ from renaming patches that's
>> another style fix?
> 
> I'd say readability. Renaming patches is clearly separated from .mk
> changes. In the case of your Samba 4.2 bump, the changes within the .mk
> file are mixed between bump-related changes, and indentation-related
> changes, and this is what bothers me.

It doesn't break any bisectability so what's the problem, you don't like
a patch that changes too many things at once?
Sorry to rehash an old thread but this kind of things don't motivate me
at all.
One thing is when you say "typo" which well, yes, it's a typo and it's
fine to correct it.
But this is just personal preference.
Regards.
