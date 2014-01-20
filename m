From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 21 Jan 2014 12:35:18 +1300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-01-19
In-Reply-To: <CAFOYHZDo0rTdF6L3qHFycupL+62+v+b1m1DJoWuJaO+JEPiFPA@mail.gmail.com>
References: <20140120073009.9260E101682@stock.ovh.net>
 <52DCDFDD.3000303@gmail.com>
 <0r90rax63l.ln2@ID-313208.user.individual.net>
 <CAFOYHZDo0rTdF6L3qHFycupL+62+v+b1m1DJoWuJaO+JEPiFPA@mail.gmail.com>
Message-ID: <CAFOYHZB8-NGmU0kEFW2D0cPmLZEE-WuAsuHrZ9R9Wz0f2xtJZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 21, 2014 at 10:03 AM, Chris Packham <judge.packham@gmail.com> wrote:
> On Tue, Jan 21, 2014 at 8:25 AM, Bernd Kuhls <berndkuhls@hotmail.com> wrote:
>> Chris Packham <judge.packham@gmail.com>
>> wrote in news:52DCDFDD.3000303 at gmail.com:
>>
>>> So far I've not been able to reproduce the issue.
>>
>> Hi,
>>
>> did you use defconfig[1] used by autobuild like this?
>> http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/68428
>
> Not quite my method. I'm actually using the config not defconfig. My
> steps are this:
>
> git clean -fxd
> git fetch
> git checkout `curl
> http://autobuild.buildroot.net/results/c59/c59b8f9d93d77c8b75c02172ff6e6072e8f62228/gitid`
> curl http://autobuild.buildroot.net/results/c59/c59b8f9d93d77c8b75c02172ff6e6072e8f62228/config
> | sed 's|/home/test|/home/chrisp|' >.config
> make
>
> I'll try the method mentioned in the link you provided.
>
>> I could reproduce the build error with tcpreplay 4.0.2, no known solution
>> though.
>>
>> Regards, Bernd
>>
>> [1]
>> http://autobuild.buildroot.net/results/9d9/9d93582362773bad2dbb495a7796682f43
>> 2e8915/defconfig

Even with this I can't see a failure. I'm starting to wonder if it has
some other host tool dependencies.
