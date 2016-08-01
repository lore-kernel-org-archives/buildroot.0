From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 1 Aug 2016 17:33:16 -0500
Subject: [Buildroot] [PATCH v3] iperf: fix "speed" display in csv report
In-Reply-To: <20160730144102.47f40b69@free-electrons.com>
References: <1469750949-64127-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20160730144102.47f40b69@free-electrons.com>
Message-ID: <CANQCQpZMKd6+mX08r4TjgGwUXTx7Ou-ECk9zXec1M=L2awFcPQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas

On Saturday, July 30, 2016, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 28 Jul 2016 19:09:09 -0500, Matt Weber wrote:
>> Some parameters displayed in the CSV reports are declared
>> as uint64_t, but the printf format doesn't reflect this.
>>
>> Submitted bug: https://sourceforge.net/p/iperf/bugs/66/
>>
>> Signed-off-by: Matt Poduska <matt.poduska@rockwellcollins.com>
>> Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
>> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
>> ---
>
> Applied to master, thanks. Could you send the patch to the upstream
> project at https://sourceforge.net/projects/iperf2/. Note: this is a
> different upstream than the one you submitted the patch. The one to
> which you submitted the patch seems to no longer be active. iperf2 is
> active, and has made a release in June 2016.

Opened the following ticket
https://sourceforge.net/p/iperf2/tickets/7/

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure
Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted Third
Party Intellectual Property (TPIP) content must be encrypted and sent to
matthew.weber at corp.rockwellcollins.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160801/8c32966d/attachment.html>
