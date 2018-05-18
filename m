From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 18 May 2018 08:07:51 -0500
Subject: [Buildroot] [PATCH v4 5/5] support/scripts/pkgstats: add CPE
 reporting
In-Reply-To: <5afe4c1839fcf_1eae2ae8fa169d84698de@ultri5.mail>
References: <CANQCQpYhWzrvpbRqfVm__nrdGe7_ThfW9smmCD4CKSBKk4ySwg@mail.gmail.com>
 <5afe4c1839fcf_1eae2ae8fa169d84698de@ultri5.mail>
Message-ID: <CANQCQpbxNjEzyjQp14kQuh-HNQ2q5eCr-9PLq_K9XvoEqHukFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo,

On Thu, May 17, 2018 at 10:44 PM, Ricardo Martincoski
<ricardo.martincoski@gmail.com> wrote:
> Hello,
>
> On Fri, May 18, 2018 at 12:21 AM, Matthew Weber wrote:
>
>> I caught Arnout on IRC today and my v5 patchset reflects his
>> suggestion.  Ended up calling the class/module file
>> support/scripts/cpedb.py and support/scripts/cpe-report for the
>
> Good names IMO.
>
> Just for reference, in the same machine with v5 takes 3m13,630s to run pkg-stats.
> In the current master: 1m40,318s
>
>> checker script.  I do see what you mean about a user facing script.
>> What do others think?
>
> Let's wait for more input.
>
> But if for any reason you send a v6, I would suggest to:
> Merge patch 7 back to 5.
> Split patch 6 into one changing print to print(), and another one
> adding CPE report.
>

I just split the  print to print() out into a seperate
http://patchwork.ozlabs.org/patch/916300/.

I'll respin v6 after more feedback and fold the cpe-report in with the
cpedb (7 into 5).

Matt
