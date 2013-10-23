From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 23 Oct 2013 13:21:59 +0200
Subject: [Buildroot] Tool to check packages updates
In-Reply-To: <CACjG4BJq5TXvpMAoU7w3JgTVrOGHpeKng88HU03Rf_=XunPKAQ@mail.gmail.com>
References: <CACjG4BJq5TXvpMAoU7w3JgTVrOGHpeKng88HU03Rf_=XunPKAQ@mail.gmail.com>
Message-ID: <CAAXf6LW1c32E_BFwbD6JKMCRKWtCw4r7pc9xuj3_DPsGyjL=SA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnaud,

On Tue, Oct 22, 2013 at 7:06 PM, arnaud aujon <arnaud.aujon@gmail.com> wrote:
> Hi,
>
> As we talk earlier in the mailing list, I started working on a python script
> to automatically check if a package can be updated.
>
> For now, the result of the script is : 837 packages (115 up to date, 154 old
> and 568 unknown)

The autobuild server seems to have a different package count:
http://autobuild.buildroot.org/stats/

Packages using the generic infrastructure 306
Packages using the cmake infrastructure 19
Packages using the autotools infrastructure 807
Packages not using any infrastructure 0

Since your script only sees 837 packages, I think you may be missing
some, unless the difference is only due to the duplicate counting of
host and target packages...

The above data is generated using support/scripts/pkg-stats

Best regards,
Thomas
