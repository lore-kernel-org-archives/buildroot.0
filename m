From: Ryan Wilkins <ryan@deadfrog.net>
Date: Tue, 23 Jul 2013 16:43:45 -0400
Subject: [Buildroot] Problem compiling local code
In-Reply-To: <CAHXCMMJGYBz5Zcd+M=Z3Gk13GyKZF7mzf6+jVujPikG=oR5UMg@mail.gmail.com>
References: <4FDB62BA-61E8-4C1C-8835-61BC2DCF0FA4@deadfrog.net>
 <CAAXf6LXmwk0NwheagUtnSX5u9iZei2ieJLs6+XyFqRXm4zKSyA@mail.gmail.com>
 <79A67ED1-220E-4FA4-BD5B-01A70D079C06@deadfrog.net>
 <6A282818-6448-427C-A748-B4FFC1934E7D@deadfrog.net>
 <CAAXf6LUg2_Nfxuys9cj22P0a7VpeP1NF5JyCYwrnaP+CbDB-Kw@mail.gmail.com>
 <CAHXCMMJGYBz5Zcd+M=Z3Gk13GyKZF7mzf6+jVujPikG=oR5UMg@mail.gmail.com>
Message-ID: <55D431F7-FC6F-41F9-B012-38F3BF2363F5@deadfrog.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Jul 23, 2013, at 3:27 AM, Samuel Martin <s.martin49@gmail.com> wrote:

> Hi Thomas, Ryan, all,
> 
> 2013/7/23 Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>:
>> Hi Ryan,
>> 
>> On Mon, Jul 22, 2013 at 10:38 PM, Ryan Wilkins <ryan@deadfrog.net> wrote:
>> 
>> Thanks for reporting back. Buildroot indeed expects
>> BR2_PACKAGE_<packagename> in the Config.in files, and
>> <packagename>_... for the .mk files. I also couldn't find this
>> restriction explicitly mentioned in the documentation, it's only
>> implicitly shown in the examples.  You're very welcome to send a patch
>> to update the documentation in this respect!
> Actually it's already in the documentation:
> http://buildroot.org/downloads/manual/manual.html#package-name-variable-relation
> 
> Anyway, you're more than welcome to submit patch for the doc ;-), to
> make this point more obvious,
> or any other things you've found uncovered in the manual.
> 

Going and (re)reading the section, I would say that it's not at all obvious.  In fact, as I read it, it seems to promote the use of the variables as I had tried and failed to use them.  I haven't submitted patches for documentation in the past so I'll have to research it and then type something up to submit.

Thanks for pointing out the section.

Best,
Ryan Wilkins
