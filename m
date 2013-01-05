From: Alex Bradbury <asb@asbradbury.org>
Date: Sat, 5 Jan 2013 16:28:12 +0000
Subject: [Buildroot] [PATCH 3/3] rpi-fw: New package
In-Reply-To: <CAGduivxnhxFMp9Vtz01Xt46+qKRD7xOcXBAq3ck-gXppYzqATA@mail.gmail.com>
References: <cover.1357394983.git.maxime.hadjinlian@gmail.com>
 <0a82214a34f519691ff795260820907a7a8b4cfc.1357394983.git.maxime.hadjinlian@gmail.com>
 <CA+wH2971Nbf8TJJOHiP5gCFTGqtc=b2YkxLEs9m1Mo2LVEkbgQ@mail.gmail.com>
 <CAGduivxnhxFMp9Vtz01Xt46+qKRD7xOcXBAq3ck-gXppYzqATA@mail.gmail.com>
Message-ID: <CA+wH296DQzLhAczxaUx+D81DEQRY=TSo5tu1V9RAW+e9tyXwsg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5 January 2013 16:09, Maxime Hadjinlian <maxime.hadjinlian@gmail.com> wrote:
> On Sat, Jan 5, 2013 at 4:52 PM, Alex Bradbury <asb@asbradbury.org> wrote:
>> It's not clear to me that you want a config.txt at all, but if you are
>> going to add one I'm not sure it's appropriate to overclock the sdram
>> by default.
> The sdram is not over clocked, according to this page :
> http://elinux.org/RPiconfig
> The default is 400Mhz.

You are of course correct, my bad.

Alex
