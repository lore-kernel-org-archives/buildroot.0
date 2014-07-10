From: Eial Czerwacki <eial@scalemp.com>
Date: Thu, 10 Jul 2014 17:34:53 +0300
Subject: [Buildroot] ping not working in a glibc based buildroot
In-Reply-To: <20140710142452.GV3003@tarshish>
References: <53BD576F.1060008@scalemp.com> <53BE83E8.2010906@scalemp.com>
 <20140710142322.188e88ed@free-electrons.com> <53BE887E.7070606@scalemp.com>
 <20140710145619.5925fa1b@free-electrons.com> <53BE8EF2.9000306@scalemp.com>
 <20140710153435.6b2ab536@free-electrons.com> <53BE97D3.5090009@scalemp.com>
 <20140710160659.18c3af57@free-electrons.com> <53BE9FA5.9070002@scalemp.com>
 <20140710142452.GV3003@tarshish>
Message-ID: <53BEA48D.2080002@scalemp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Baruch,

On 07/10/2014 05:24 PM, Baruch Siach wrote:
> Hi Eial,
>
> On Thu, Jul 10, 2014 at 05:13:57PM +0300, Eial Czerwacki wrote:
>> I've added libnss_dns-2.18.so to the img and libresolv.so and it seems
>> to be working.
>> the files are missing because I work in a kinda limited size.
> You may consider using uClibc or musl if your storage capacity is that tight.
>
> baruch
>
we were using uclibc but for reasons I cannot disclose, we needed to
move to glibc.

as said before, adding the two libs above worked in the simulator, now I
need to make it work on the actual machine.

Thanks,

Eial.
