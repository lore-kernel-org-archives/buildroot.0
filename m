From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 4 Mar 2018 20:49:06 -0600
Subject: [Buildroot] Defconfigs failing to build with gcc 6.x
In-Reply-To: <CAOMZO5AcX8U3ox+EmDkbSUyU+48RfXtvOHQx2W=tSUTx2HEreQ@mail.gmail.com>
References: <20180304224808.566fa00d@windsurf.home>
 <CAOMZO5DXmGWSbfE9PEp+srYkM8ieMX0NYOmyOgza0cuSHsjr9A@mail.gmail.com>
 <CAOMZO5Dy61MpiKuD-ExCj+OQA0RRT=3x=BhuB2rWub71uM9TEw@mail.gmail.com>
 <CANQCQpYVgMa4QfBMMFh9=fiGjYr8xF712a9Kyn7vGnoZUDPNcg@mail.gmail.com>
 <CAOMZO5AcX8U3ox+EmDkbSUyU+48RfXtvOHQx2W=tSUTx2HEreQ@mail.gmail.com>
Message-ID: <CANQCQpbtOE=E_NVY03oeR6y+JU1aMDvK+kjN_ShZpBSMQP=cqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio/Thomas,

On Sun, Mar 4, 2018 at 7:24 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Matt,
>
> On Sun, Mar 4, 2018 at 10:11 PM, Matthew Weber
> <matthew.weber@rockwellcollins.com> wrote:
>
>> I'd be all for removing and replacing it with a config for p1025twr.
>> I can put together a patchset for that one and a t1040d4.
>

Removed p1010: http://patchwork.ozlabs.org/patch/881276/

I've started a p1025 board and it looks like it builds.  We'll see if
it boots tomorrow and I'll send the replacement.

Matt
