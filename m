From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 3 Nov 2011 14:22:48 +0100
Subject: [Buildroot] Migration to the latest stable release
In-Reply-To: <CACXKkoZ3hxrhy00WxLPLCmbHet00e1_nnvgGc1E=U+w8hS5vSA@mail.gmail.com>
References: <CACXKkoZ3hxrhy00WxLPLCmbHet00e1_nnvgGc1E=U+w8hS5vSA@mail.gmail.com>
Message-ID: <CAAXf6LU45N-CXRjCKF854jdii-=ZQ+6b+k7xiJUt5-2txZ7COQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Nov 3, 2011 at 2:15 PM, Milan Stevanovic
<milan.o.stevanovic@gmail.com> wrote:
> Hi,
>
> I want to migrate to the latest buildroot stable release. Also, I want to
> keep all my changes after migration.
> Is there a some procedure for this?

Assuming you have not put your current buildroot environment in a
version control system, you'll have to first generate a list of
changes you have made compared to the baseline you started from, and
then reapply the changes on the new release (you could use diff/patch
to help with this).

Of course, type of changes you made will determine how easy this goes.

Best regards,
Thomas

>
> Best regards
> Milan
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
