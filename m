From: Stephan Hoffmann <sho@relinux.de>
Date: Mon, 03 Dec 2012 15:18:11 +0100
Subject: [Buildroot] [PATCH 10/13] Add update-all-config target
In-Reply-To: <CAAXf6LWwO6OkBhz03vsBekTWv4=9Bb7eO-sskvzhdTCD58K7oA@mail.gmail.com>
References: <20121013231344.17317.92930.stgit@localhost>
 <20121013231438.17317.13801.stgit@localhost>
 <CAAXf6LWwO6OkBhz03vsBekTWv4=9Bb7eO-sskvzhdTCD58K7oA@mail.gmail.com>
Message-ID: <50BCB4A3.5080003@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 14.10.2012 20:45, schrieb Thomas De Schampheleire:
> Hi,
>
> On Sun, Oct 14, 2012 at 1:14 AM, Arnout Vandecappelle (Essensium/Mind)
> <arnout@mind.be> wrote:
>> > From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> >
>> > The update-all-config target updates all the external configuration
>> > file with their current values.  This includes:
>> > - buildroot
>> > - busybox
>> > - linux
>> > - crosstool-ng
>> > - uClibc
>> >
>> > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> I like this idea, and would propose to go through with this regardless
> of the outcome of the series.
> See below for some comments though
Hi,

I also like this idea much.

I'd like to go one step further and put buildroot's default config files
in the board/company/product hierarchy, too. Then everything would be in
one place.

This approach would be similar to that used by uClinux where all
relevant board specific files are in vendors/company/product.

Kind regards

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
