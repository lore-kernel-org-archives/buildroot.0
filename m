From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 8 Feb 2017 11:20:32 -0500
Subject: [Buildroot] [PATCH 3/3] ncurses: bump to 6.0
In-Reply-To: <20170208095903.1ad79bd4@free-electrons.com>
References: <20170207180239.31904-1-Adamduskett@outlook.com>
 <20170208095903.1ad79bd4@free-electrons.com>
Message-ID: <CAFSsvmou7U-Qr=n56+iCkfUvuYWeZFexaBpX+RmcxhUpJSzFwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

On Wed, Feb 8, 2017 at 3:59 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue,  7 Feb 2017 13:02:39 -0500, Adam Duskett wrote:
>> ncurses 6.0 has been out for a while now (August 8th 2015!)  This
>> patch brings us up to the latest version.  Not too many changes had
>> to occure to get this working well.
>>
>> - The first patch is no longer needed as it was fixed in the new release.
>> - The other two packages are still applicable, however I did have to change
>>   the line numbers.  Because that is the only thing I had to change, I didn't
>>   put my signature on them.  If this is needed I will gladly do so.
>> - A new option: --with-pkg-config-libdir has been added. Without it
>>   pkg files wouldn't install to the correct location.
>> - NCURSES_ABI_VERSION is no longer needed, as there is only 6.
>>
>> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
>
> Did you test this with a large number of ncurses reverse dependencies
> (i.e packages that depend on ncurses) ?
>
> Major updates to ncurses tend to easily break packages that rely on
> ncurses, so we really need to check a good number of packages before
> committing this. Could you indicate which Buildroot configuration you
> have tested to validate this bump?
>

As previously talked about in IRC, I am using several packages that
require ncurses.
SNGREP, alsamixer, readline, and nano are just a few of them.   They
all work well with 6.0!

> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
Adam
