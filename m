From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Mon, 14 Sep 2015 21:54:57 -0500
Subject: [Buildroot] [PATCHv5 4/4] docs/manual: add section about size
	graphing
In-Reply-To: <20150903104326.GE3689@free.fr>
References: <1441228505-23235-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1441228505-23235-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150903103700.GD3689@free.fr> <20150903104326.GE3689@free.fr>
Message-ID: <CALq67GBoSnTY-G7w3SjdsUpO0QWPqhv5c=2Gsd3RNS-Z1u2=xA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Yann,

On Thu, Sep 3, 2015 at 5:43 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, All,
>
> On 2015-09-03 12:37 +0200, Yann E. MORIN spake thusly:
>> Thomas, All,
>>
>> On 2015-09-02 23:15 +0200, Thomas Petazzoni spake thusly:
>> > +* +output/build/package-size-stats.csv+, a CSV file giving the size
>> > +  contribution of each package to the overall root filesystem size
>>
>> Ditto, that was not generated.
>
> Sorry, ditch that comment. It *was* generated.
>
> It's just that I only looked at the base filename, and expected it in
> the graphs/ sub-dir, not in build/ . That's by looking at patch 3 that I
> noticed they were put in there.
>
> I think it makes more sense to put those .csv files in the graphs/
> sub-dir.

I agree with Yann in that the CSV files make the most sense to be put
in graphs/ sub-dir. In fact, I have modified this locally while carry
this patch to place them there.

On a side note - it would be great to see this feature merged :)

Thanks,
-Ryan
