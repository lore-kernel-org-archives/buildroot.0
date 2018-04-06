From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 6 Apr 2018 10:36:12 -0500
Subject: [Buildroot] [PATCH 1/2] cramfs: change to new site location
In-Reply-To: <TY1PR01MB1562ADDDE3949C2BC35FC4408ABA0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20180213195449.51516-1-chris.brandt@renesas.com>
 <20180213195449.51516-2-chris.brandt@renesas.com>
 <20180213211453.519b65eb@windsurf.lan>
 <SG2PR06MB1165EA4292BE78ADF8D3A1678AF60@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CANQCQpZgjJqSpY9Pma9wsB=QtPL5onLYLb5pdteTSUULOcMF-A@mail.gmail.com>
 <TY1PR01MB1562ADDDE3949C2BC35FC4408ABA0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Message-ID: <CANQCQpZZMp8MXMRDMHg6vOr4f-GRYvBBeZB1MSNQvMk9BnfBzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris,

On Fri, Apr 6, 2018 at 10:02 AM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> Hello Matthew,
>
> On Thursday, April 05, 2018, Matthew Weber wrote:
>> > I don't have any big endian systems, so I can't test it either.
>> >
>> > But, Nicolas said that if someone is willing to test it and sign off on
>> > it, he would add it to his repository.
>>
>> Hi, I ran into a bug in the existing buildroot cramfs fs support for
>> big endian and Thomas pointed me at this patchset.  I've
>> updated/tested my local build with your patches and included the big
>> endian fix.
>>
>> Feel free to pull this patch into your patchset (or hopefully upstream
>> merges first :-) )
>> https://patchwork.ozlabs.org/patch/895499/
>>
>> Upstream of an updated big endian support patch
>> https://github.com/npitre/cramfs-tools/pull/1
>>
>> Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
>
>
> Great! I struggled with trying to get a PowerPC QEMU up and running, so
> I never completed this task.
>
> However, I will say this: When discussing to incorporate that old endian
> patch back into Nicolas's repo, he requested that the new functions
> have a more proper prefix like swap_xxx. The names "fix_xxx" are not really
> good names to describe what they are doing.
>

Wanted to comment my patch is a newer version of an upstream patch and
not the old Buildroot patch.  However I do see that naming is similar
in this patch.  I'll update fix -> swap.

Matt
