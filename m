From: nickich <nickich@abv.bg>
Date: Thu, 4 Jun 2009 07:31:35 -0700 (PDT)
Subject: [Buildroot]  switch_root...
Message-ID: <23869987.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

When I use switch_root I have an error "not rootfs", which comes from the
condition !S_ISREG(st1.st_mode). When I remove this condition, all seems to
work fine (or at least I think so).

What is this check for? 
Can it be removed safely? 
What's wrong with my system to break here?

Regards,
Nikolay

-- 
View this message in context: http://www.nabble.com/switch_root...-tp23869987p23869987.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
