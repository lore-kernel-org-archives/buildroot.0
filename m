From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 16 Jan 2018 09:39:12 -0600
Subject: [Buildroot] [PATCH] picocom: bump to version 3.0
In-Reply-To: <1a63141e34939dac4fac56fb58ff42110b751ab4.1516108676.git.baruch@tkos.co.il>
References: <1a63141e34939dac4fac56fb58ff42110b751ab4.1516108676.git.baruch@tkos.co.il>
Message-ID: <CANQCQpYDVPCZ6dOXG6W-VQ4ps9=SbZuOnrpeLL77ExYuweTUHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Tue, Jan 16, 2018 at 7:17 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Drop LDFLAGS forcing. Makefile now uses appends to environment LDFLAGS.
>
> Add license hash.
>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Ran through a basic test-pkg run across all of its targets.

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
