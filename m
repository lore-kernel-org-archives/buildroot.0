From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 12 Sep 2013 18:51:22 +0200
Subject: [Buildroot] Building Manual Errors
In-Reply-To: <20130912183745.64503913@skate>
References: <OF433C040C.2486075F-ON86257BE2.00813B52-86257BE2.0082DB6E@rockwellcollins.com>
 <CAAXf6LWJ8DM-UBfEi=quWo7g-g_RGSYuRgEJM_y__mh+10F3pQ@mail.gmail.com>
 <OF56171A80.616C14AA-ON86257BE4.0059D6AD-86257BE4.005A710F@rockwellcollins.com>
 <20130912183745.64503913@skate>
Message-ID: <CAAXf6LXS_9G=329VecwOD8hd9x+DD8+6O96o7xPn2jZi6s2iAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Sep 12, 2013 at 6:37 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Ryan Barnett,
>
> On Thu, 12 Sep 2013 11:27:51 -0500, Ryan Barnett wrote:
>
>> > Samuel: shouldn't we check the dependencies for building the manual
>> > before someone attemps to do that? On my Linux Mint system
>> > (=Ubuntu-based) I had to install asciidoc (which pulled in a lot of
>> > tex deps) and w3m.
>>
>> One I idea I had to solve these dependancies issues between specific
>> versions and packages for all the different distro's is to add all
>> of the packages that are needed for building manual or any other
>> buildroot maintenance script (stuff that is in support/scripts) to
>> buildroot as host packages and then put together a
>> buildroot_maintenance_defconfig that will build all of the packages
>> need for the host system to run this scripts. Let me know what
>> you think about that and we can maybe continue this discussion
>> in a different thread.
>
> My understanding is that asciidoc requires a very large number of TeX /
> LaTeX dependencies which I really don't think we want to package in
> Buildroot, so I believe doing this is not such a good idea.
>
> Normal users shouldn't need to build the manual, since it's available
> online for reading. Only developers will care about this, and I believe
> installing asciidoc is a reasonable requirement for developers.

I agree with this.
But I do think that it would be nice to check for missing
dependencies, being asciidoc and w3m.

Best regards,
Thomas
