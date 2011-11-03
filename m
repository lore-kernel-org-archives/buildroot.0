From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 3 Nov 2011 15:01:21 +0100
Subject: [Buildroot] Migration to the latest stable release
In-Reply-To: <CACXKkoaHDhFzBT6rskRzoEDrq1e7hL5R03+v0zkV7dGodoaduQ@mail.gmail.com>
References: <CACXKkoZ3hxrhy00WxLPLCmbHet00e1_nnvgGc1E=U+w8hS5vSA@mail.gmail.com>
 <CAAXf6LU45N-CXRjCKF854jdii-=ZQ+6b+k7xiJUt5-2txZ7COQ@mail.gmail.com>
 <CACXKkoaHDhFzBT6rskRzoEDrq1e7hL5R03+v0zkV7dGodoaduQ@mail.gmail.com>
Message-ID: <CAAXf6LW=hJVyLZs6DO7=QdM1yNKO=YaBJ5VLvEp=0Xj7qXy-Ag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Milan,

On Thu, Nov 3, 2011 at 2:29 PM, Milan Stevanovic
<milan.o.stevanovic@gmail.com> wrote:
> On 3 November 2011 14:22, Thomas De Schampheleire
> <patrickdepinguin+buildroot@gmail.com> wrote:
[..]
>> >
>> > I want to migrate to the latest buildroot stable release. Also, I want
>> > to
>> > keep all my changes after migration.
>> > Is there a some procedure for this?
>>
>> Assuming you have not put your current buildroot environment in a
>> version control system, you'll have to first generate a list of
>> changes you have made compared to the baseline you started from, and
>> then reapply the changes on the new release (you could use diff/patch
>> to help with this).
>>
>> Of course, type of changes you made will determine how easy this goes.

> Hi,
>
> Thanks for fast replay.
>
> Unfortunately, I was not precise.
> Current buildroot environment is under git version control system.

In that case, you can use the 'git pull' command to fetch the new
version (you'll probably want to specify a specific tag) and merge
your changes with the latest release. This is generic git usage,
nothing buildroot specific.

Best regards,
Thomas
