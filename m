From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Dec 2012 16:32:10 +0100
Subject: [Buildroot] Using a precompiled busybox toolchain as an
 external toolchain
In-Reply-To: <CAKvQZ_3-v9ArCy0b6Q9VmzNToDaigk1=USPJsgUKpEptzeP1yA@mail.gmail.com>
References: <CAKvQZ_0sLwXqmGeTdeC6EBqqZ_FN4s6cVcnM3OwVrSHHYHfWDA@mail.gmail.com>
 <20121218135336.2e24d6bc@skate>
 <CAKvQZ_3-v9ArCy0b6Q9VmzNToDaigk1=USPJsgUKpEptzeP1yA@mail.gmail.com>
Message-ID: <20121218163210.1573a9c7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Willy Lambert,

On Tue, 18 Dec 2012 16:19:47 +0100, Willy Lambert wrote:

> aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaah. To be honest an entry
> in the manual to state this would be nice.

Indeed. Feel free to submit a patch for the manual :-)

> thanks, should I understand that I can't publish the buildroot
> toolchain on another  PC without installing it at the __same__ place ?

Your understanding is correct. Making the toolchain relocatable is part
of our TODO-list, though.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
