From: Patrick Doyle <wpdster@gmail.com>
Date: Sun, 28 Feb 2016 19:47:10 -0500
Subject: [Buildroot] Is it possible to override a package version from
	BR2_EXTERNAL?
In-Reply-To: <56D0B227.2060104@mind.be>
References: <CAF_dkJDcBuOOe3Z5zGfS=eA8tJ9k54DqRahGuZeR8vGE1T+FBQ@mail.gmail.com>
 <56D0B227.2060104@mind.be>
Message-ID: <CAF_dkJDxOAh_vz3Ww4HoqgOCRM+n0ZXQYbDQ+z34Nzw1noKHUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 26, 2016 at 3:14 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 02/26/16 16:03, Patrick Doyle wrote:
>> I am asking because it appears (for the moment) that the 2016.01
>> host-uboot-tools mkenvimage utility does not generate an environment
>> file compatible with my non-2016.01 u-boot.
>
>  That is weird... As far as I know, mkenvimage should stay backward-compatible.
> Unless, of course, your u-boot has some hacks that make it incompatible with
> upstream u-boot...
And, in fact, mkenvimage was fine... I just took careful aim at my
foot and fired my gun :-)

But I was still curious about how to override the version installed
for a single package.  Now I know the answer is "You can't do that
easily."

OK, thanks.

--wpd
