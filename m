From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Mar 2012 14:17:42 +0100
Subject: [Buildroot] Random build results now available online
In-Reply-To: <CAL7hd5+yVNReHh=waU8E7YvvSM6How7-UaHvKU-V71G4JyjevA@mail.gmail.com>
References: <20120321101327.49d34f93@skate>
 <CAL7hd5KAXfF-0P5oR-RLev42=SZ8XXLxmvUjTCbe7OoyLAWCHA@mail.gmail.com>
 <20120321140013.11af8da2@skate>
 <CAL7hd5+yVNReHh=waU8E7YvvSM6How7-UaHvKU-V71G4JyjevA@mail.gmail.com>
Message-ID: <20120321141742.3b988cb8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 21 Mar 2012 15:10:25 +0200,
Nikolay Nikolaev <nicknickolaev@gmail.com> a ?crit :

> Suggestion: Can you add "Arch" and "Failed reason" to the failed
> items? That way it's clearly visible that
> "liburcu-0.6.7" failed building for "arm".

It is already the case. Taking one particular build example, the title
is:

"""
Build failed at 2012-03-21 13:49:06
"""

and the description is

"""
A Buildroot build result, submitted by Peter Korsgaard (gcc10)
 failed. The reason of the failure is: liblockfile-1.08. The build used
the Git commit id 832b1ef746e7df252ff42b19f6083f3716f70eb9 and was
targetting the arm architecture.
"""

However, the description is only available in the
<description>...</description> field. Maybe some RSS readers only look
at the <content:encoded>...</content:encoded> field, which contains an
HTML version of the description. I will add it later and we'll see if
it fixes things for your RSS reader.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
