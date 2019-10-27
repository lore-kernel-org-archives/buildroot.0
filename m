From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 Oct 2019 09:19:21 +0100
Subject: [Buildroot] [PATCH 1/3] board: add Beelink GS1 support
In-Reply-To: <CAJiuCce6hDR0-FCYcWRSeknqhobOTcZT8rCf7+M3dCyLZrtK7g@mail.gmail.com>
References: <20190920190813.21516-1-peron.clem@gmail.com>
 <20190920190813.21516-2-peron.clem@gmail.com>
 <20191026100733.075a89ab@windsurf.home>
 <CAJiuCcdXSOBqc5ngfTCg4=uo8YGgWKQwwawm3iEOQWPbj1B7Gg@mail.gmail.com>
 <20191026115609.05639d3c@windsurf.home>
 <CAJiuCce6hDR0-FCYcWRSeknqhobOTcZT8rCf7+M3dCyLZrtK7g@mail.gmail.com>
Message-ID: <557a67b2-7bbe-c2c9-a25c-9ddb6a96dbfc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26/10/2019 11:58, Cl?ment P?ron wrote:
> On Sat, 26 Oct 2019 at 11:56, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>> On Sat, 26 Oct 2019 10:56:02 +0200
>> Cl?ment P?ron <peron.clem@gmail.com> wrote:
>>
>>> Do you think the other patches can be merged too or are they to
>>> "user-specific" ?
>>
>> As Arnout said, PATCH 3/3, for the part that enables DHCP on eth0, can
>> be added using BR2_SYSTEM_DHCP="eth0". This is acceptable upstream.
>>
>> Customizing the root password is not, as is adding autossh and dropbear.
>>
>> Adding mdev could be acceptable, for example if it's needed to load
>> some kernel modules.
> Yes it is,

 It helps if you put a comment in the defconfig that says why it is needed (e.g.
"to autoload ethernet driver module").

 Regards,
 Arnout
