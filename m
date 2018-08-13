From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Mon, 13 Aug 2018 11:10:05 -0700
Subject: [Buildroot] host-libselinux atomics with GCC 4.4
In-Reply-To: <CANQCQpZ2mVuPkeeiR5yxKf3Cs7xUiADuO0dAMkZxsLaCa_iQCw@mail.gmail.com>
References: <20180812060015.A385B207E5@mail.bootlin.com>
 <20180812223629.2bac8ebe@windsurf>
 <CANQCQpbDmecDS1LE8HY46y1BnEtJH=cRsmo7KEbZhsNZvHhquw@mail.gmail.com>
 <CANQCQpZ2mVuPkeeiR5yxKf3Cs7xUiADuO0dAMkZxsLaCa_iQCw@mail.gmail.com>
Message-ID: <95ce06f3-5560-81f3-4949-0a2842b7b78a@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/13/2018 08:30 AM, Matthew Weber wrote:
> All,
> On Mon, Aug 13, 2018 at 9:36 AM Matthew Weber
> <matthew.weber@rockwellcollins.com> wrote:
>> Hollis / Thomas,
>> On Sun, Aug 12, 2018 at 3:36 PM Thomas Petazzoni
>> <thomas.petazzoni@bootlin.com> wrote:
>>>>        x86_64 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/e48c974980b8228302a76ac5b6afad14e7ce81c1 |
>> Require host gcc at least 4.7
>> http://patchwork.ozlabs.org/patch/957001/
> v2.  http://patchwork.ozlabs.org/project/buildroot/list/?series=60561
>
> I've also opened a upstream ticket
> https://github.com/SELinuxProject/selinux/issues/97.  We'll see if I
> can get traction there and maybe that determines kconfig vs patch?
Thanks for opening that upstream issue.

Due to the surprisingly quick response from the maintainers, it looks 
like we already have an answer: the patch is OK, so we don't need the 
Kconfig changes. (A more aggressive patch is almost certainly OK too, 
but I doubt anybody wants to fuss about it.)

Hollis Blanchard
Mentor Graphics Emulation Division
