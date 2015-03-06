From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Mar 2015 10:26:32 +0100
Subject: [Buildroot] [PATCH 2/2] samba4: bump to version 4.2.0
In-Reply-To: <54F96D83.4010304@zacarias.com.ar>
References: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>
 <1425588249-20942-2-git-send-email-gustavo@zacarias.com.ar>
 <20150305232946.3620697e@free-electrons.com>
 <54F8F0AC.8030707@zacarias.com.ar>
 <20150306094008.7baf8c91@free-electrons.com>
 <54F96D83.4010304@zacarias.com.ar>
Message-ID: <20150306102632.20dff6f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 06 Mar 2015 06:04:03 -0300, Gustavo Zacarias wrote:

> Well,  i've done it several times in the past, just search for "While at
> it" and "Also" in the commit logs - in fact it was you who committed
> them in many cases (and not only mine).
> Does this mean that i should separate bumps from adding hash files
> and/or renaming patches?

There is obviously a line to draw between things that we can do in the
same commit, and things that we should not. I believe adding a hash
file together with a bump is OK since anyway doing the bump would
change the hash file.

> Because the workload and noise committing will go up higher if that's
> the choice.
> And how does a package style fix differ from renaming patches that's
> another style fix?

I'd say readability. Renaming patches is clearly separated from .mk
changes. In the case of your Samba 4.2 bump, the changes within the .mk
file are mixed between bump-related changes, and indentation-related
changes, and this is what bothers me.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
